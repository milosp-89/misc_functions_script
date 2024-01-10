-- function for taking submission time

USE [xxx]
go;

create function [dbo].[submission_time] (@start_question datetime, @submitted_at_question nvarchar(max))
returns decimal(10, 2)
as
begin
    declare @final decimal(10, 2);
    set @final = cast
					(round
						(datediff
							(second, @start_question,
									 left(@submitted_at_question, charindex('+', @submitted_at_question) - 1)) 
									 / cast(60 AS decimal(10, 2)), 2) as decimal(10, 2));
    return @final;
end;
go
