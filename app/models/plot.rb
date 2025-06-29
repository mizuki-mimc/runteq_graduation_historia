class Plot < ApplicationRecord
  belongs_to :story, touch: true
  has_many :plot_world_guides, dependent: :destroy
  has_many :world_guides, through: :plot_world_guides
  has_many :plot_characters, dependent: :destroy
  has_many :characters, through: :plot_characters
  has_many :plot_flags, dependent: :destroy
  has_many :flags, through: :plot_flags

  accepts_nested_attributes_for :plot_flags, allow_destroy: true

  validates :chapter, presence: true, length: { maximum: 10 }
  validates :title, length: { maximum: 30 }
  validates :summary, length: { maximum: 30 }

  validate :validate_plot_flags_status
  validate :validate_flag_uniqueness_in_story

  private

  def validate_plot_flags_status
    plot_flags.each do |plot_flag|
      next if plot_flag.marked_for_destruction?

      unless plot_flag.check_created || plot_flag.check_recovered
        errors.add(:base, "フラグ「#{plot_flag.flag.title}」の状態（設置または回収）を選択してください。")
      end
    end
  end

  def validate_flag_uniqueness_in_story
    other_plots_scope = self.id ? story.plots.where.not(id: self.id) : story.plots

    plot_flags.each do |pf|
      next if pf.marked_for_destruction?
      next unless pf.check_created_changed? || pf.check_recovered_changed?

      if pf.check_created
        if other_plots_scope.joins(:plot_flags).where(plot_flags: { flag_id: pf.flag_id, check_created: true }).exists?
          errors.add(:base, "フラグ「#{pf.flag.title}」は、他のエピソードで既に設置済みです。")
        end
      end

      if pf.check_recovered
        if other_plots_scope.joins(:plot_flags).where(plot_flags: { flag_id: pf.flag_id, check_recovered: true }).exists?
          errors.add(:base, "フラグ「#{pf.flag.title}」は、他のエピソードで既に回収済みです。")
        end
      end
    end
  end
end
