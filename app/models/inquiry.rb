class Inquiry < ApplicationRecord

    validates :name, :presence => {:message => 'お名前を入力してください。'}
    validates :message, :presence => {:message => '管理者へのメッセ‐ジを入力してください。'}

end
