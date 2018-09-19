require 'csv'

monthlies = CSV.table('db/fixtures/monthlies.tsv', col_sep: "\t").by_row
monthlies.each do |monthly|
  Monthly.seed(:music_id, :span_s) do |s|
    Monthly.columns.each do |c|
      if c.name.to_sym == :music_id
        s.music_id = Music.where(text_id: monthly[:text_id]).first.id
      else
        next unless monthlies.headers.include? c.name.to_sym
        s.send("#{c.name}=", monthly[c.name.to_sym])
      end
    end
  end
end
