RSpec.shared_examples 'users only' do
  it do 'denies access if user isn\'t logged in'
    expect(subject).not_to permit
  end

  it 'grants access to when the user is present' do
    expect(subject).to permit(user)
  end
end
