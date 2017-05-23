class EducationFact < ActiveRecord::Base
  validates_presence_of :quote, :source, :category
  def category_enum
    {
    'Quotes': 'quotes',
    'Automation': 'automation',
    'Essential Skills': 'essential_skills',
    'Gallup Poll': 'gallup_poll',
    'Infosys Report': 'infosys_report',
    'MLTS Book': 'mlts_book'
    }
  end

  # array containing one randomly selected fact per category
  def self.random_facts
    all_facts = EducationFact.all
    grouped_facts = all_facts.group_by(&:category)
    random_facts = grouped_facts.transform_values { |fact_array| fact_array.sample }.values
    return random_facts
  end
end
