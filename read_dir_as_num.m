function [time] = read_dir_as_num(str_dir)
str_dir=correct_dir(str_dir);
time=0;
try
%days=[31 28 31 30  31  30  31  31  30  31  30  31];
days= [31 59 90 120 151 181 212 243 273 304 334 365];
year=str_dir(1:4);
  year=str2double(year);
month=str_dir(6:7);
  month=str2double(month);
day=str_dir(9:10);
  day=str2double(day);
hour=str_dir(12:13);
  hour=str2double(hour);
minute=str_dir(15:16);
  minute=str2double(minute);
second=str_dir (18:19);
  second=str2double(second);
millisecond=str_dir(21:23);
  millisecond=str2double(millisecond);
time=(year-2019)*12*31+0*days(month); %days (rok mo¿na odj¹æ 2019)
if (mod (year, 4)==0)
    time=time+1; %rok przestêpny
end
time=(time+day)*24; %hous
time=(time+hour)*60; %minutes
time=(time+minute)*60; %seconds
time=(time+second)*1000; %milliseconds
time=time+millisecond;     %all milliseconds
catch
    disp('Wrong input data');
end
end

