require 'csv'

musics = CSV.table('db/fixtures/musics.tsv', col_sep: "\t").by_row
musics.each do |music|
  Music.seed(:text_id) do |s|
    Music.columns.each do |c|
      next unless musics.headers.include? c.name.to_sym
      s.send("#{c.name}=", music[c.name.to_sym])
    end
  end
end
