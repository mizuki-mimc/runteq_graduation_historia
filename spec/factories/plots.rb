FactoryBot.define do
  factory :plot do
    chapter { "第一章" }
    title { "旅の始まり" }
    summary { "主人公が冒険に出ることを決意する。" }

    association :story
  end
end
