class Flag < ApplicationRecord
  belongs_to :story
  has_many :plot_flags, dependent: :destroy
  has_many :plots, through: :plot_flags

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true

   scope :unrecovered, -> {
    where.not(id: joins(:plot_flags).where(plot_flags: { check_recovered: true }))
  }

  def already_created_in_story?
    story.plot_flags.where(flag_id: id, check_created: true).exists?
  end

  def created?
    plot_flags.any?(&:check_created)
  end

  def recovered?
    plot_flags.any?(&:check_recovered)
  end

  def status_display
    recovered_plot_flag = plot_flags.find(&:check_recovered)
    if recovered_plot_flag
      chapter = recovered_plot_flag.plot.chapter.presence || "（章未設定）"
      return "「#{chapter}」にてフラグを回収しました！"
    end

    created_plot_flag = plot_flags.find(&:check_created)
    if created_plot_flag
      chapter = created_plot_flag.plot.chapter.presence || "（章未設定）"
      return "「#{chapter}」にフラグを立てています！"
    end

    "このフラグはまだ立てていません。"
  end

  def status_color_class
    if recovered?
      "bg-green-100 border-green-500 text-green-800"
    elsif created?
      "bg-blue-100 border-blue-500 text-blue-800"
    else
      "bg-gray-100 border-gray-400 text-gray-700"
    end
  end
end
