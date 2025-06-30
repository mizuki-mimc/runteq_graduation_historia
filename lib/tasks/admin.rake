namespace :admin do
  desc "指定されたメールアドレスのユーザーに管理者権限を付与します Usage: rake admin:set_admin[email]"
  task :set_admin, [ :email ] => :environment do |_, args|
    unless args[:email]
      puts "エラー: メールアドレスを指定してください。例: rake admin:set_admin[your_email@example.com]"
      next
    end

    user = User.find_by(email: args[:email])

    if user
      if user.update(admin: true)
        puts "成功: #{user.email} に管理者権限を付与しました。"
      else
        puts "エラー: ユーザーの更新に失敗しました。 #{user.errors.full_messages.join(', ')}"
      end
    else
      puts "エラー: 指定されたメールアドレスのユーザー(#{args[:email]})が見つかりませんでした。"
    end
  end
end
