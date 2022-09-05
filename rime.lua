function date_translator(input, seg)
   if (input == "date") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " "))
   end
end

function time_translator(input, seg)
   if (input == "time") then
      local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M"), " ")
      cand.quality = 1
      yield(cand)
   end
end

function datetime_translator(input, seg)
   if (input == "dtm") then
      --- Candidate(type, start, end, text, comment)
      yield(Candidate("dtm", seg.start, seg._end, os.date("%Y年%m月%d日 %H时%M分%S秒"), ""))
      yield(Candidate("dtm", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), " "))
   end
end
