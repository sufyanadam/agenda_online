class ParseOrg
  def self.org_text
    File.read("../spec/fixtures/sample_org_file")
  end

  def self.parse(org_text)
    tasks = {}
    org_text.lines.each_with_index do |line, index|
      tasks[index] = line if line.include?('TODO')
    end

    tasks
  end

  def self.mark_done(task)
    task.gsub('TODO', 'DONE') + indent_level_spaces(task) + "CLOSED: [#{Time.current.strftime('%Y-%m-%d %a %H:%M')}]"
  end

  def self.indent_level_spaces(task)
    total_spaces = 0
    task[0..-1].each_char { |char| total_spaces += 1 if char != 'T'; break if char == 'T' }

    ' ' * total_spaces
  end
end

   # CLOSED:[2015-07-27 Mon 00:13]
# p ParseOrg.parse(ParseOrg.org_text)
