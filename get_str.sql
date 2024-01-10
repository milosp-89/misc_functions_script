-- function to get/extract string/text between commas

use [xxx];
go

create function [dbo].[get_str] 
(
    @inputstring varchar(max),
    @startposition int,
    @endposition int
)
returns varchar(max)
as
begin
    declare @startindex int
    declare @endindex int
    declare @resultstring varchar(max)

    set @startindex = charindex(',', @inputstring, 1)
    set @endindex = charindex(',', @inputstring, @startindex + 1)

    declare @position int = 1
    while @position < @startposition - 1
    begin
        set @startindex = charindex(',', @inputstring, @endindex + 1)
        set @endindex = charindex(',', @inputstring, @startindex + 1)
        set @position = @position + 1
    end

    set @position = @startposition
    while @position < @endposition and @endindex > 0
    begin
        set @endindex = charindex(',', @inputstring, @endindex + 1)
        set @position = @position + 1
    end

    if @startindex > 0 and @endindex > 0
        set @resultstring = substring(@inputstring, @startindex + 1, @endindex - @startindex - 1)
    else if @startindex > 0
        set @resultstring = substring(@inputstring, @startindex + 1, len(@inputstring) - @startindex)
    else
        set @resultstring = null

    return @resultstring
end;
go
