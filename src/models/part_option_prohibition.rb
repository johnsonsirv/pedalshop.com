
class PartOptionProhibition < ApplicationRecord
  
  validates :part_options, presence: true

  def self.all_part_option_prohibitions
    prohibitions = fetch_prohibitions
    part_option_ids = extract_part_option_ids(prohibitions)
    part_options = fetch_part_options(part_option_ids)
    
    PartOptionProhibitionHelper.format(prohibitions, part_options)
  end

  private

  def fetch_prohibitions
    select(:id, :part_options).pluck(:id, :part_options)
  end

  def extract_part_option_ids(prohibitions)
    prohibitions.flat_map { |_, prohibitions_hash| prohibitions_hash.keys }.uniq
  end

  def fetch_part_options(part_option_ids)
    PartOption.where(id: part_option_ids).pluck(:id, :name).to_h
  end
end