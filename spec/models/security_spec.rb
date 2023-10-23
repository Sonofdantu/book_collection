RSpec.feature 'Security Features', type: :feature do
  scenario 'Unauthorized user is redirected',:database => :truncation  do
    visit attendances_path
    expect(page).to have_content('You are not authorized to access this page.')
  end
end