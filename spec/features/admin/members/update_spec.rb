RSpec.describe 'Members UPDATE' do
  let!(:member)  { create(:user, email: 'tester@example.com') }

  before do
    assume_admin_logged_in
    visit "/admin/members/#{member.id}/edit"
  end

  context 'invalid input' do
    it 'validates title presence' do
      fill_in 'Email',  with: ''
      click_button 'Update User'

      expect_an_error member_email: :blank
    end
  end

  context 'valid input' do
    it 'create new user' do
      fill_in 'Email',  with: 'another@example.com'
      click_button 'Update User'

      expect(page).to have_current_path '/admin/members'
      expect(page).to have_content 'another@example.com'
    end
  end
end
