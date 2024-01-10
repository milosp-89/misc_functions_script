-- function to remove spaces and symbols from a text/string
-- add more symbols if needed!

use [xxx];
go

create function [dbo].[rem_space_symb]
(
    @input_string nvarchar(max)
)
returns nvarchar(max)
as
begin
    declare @output_string nvarchar(max)
    set @output_string = 
	replace(replace(replace(replace(replace(replace(replace(replace
		(replace(replace(replace(replace(replace(replace(replace(replace
			(@input_string, ' ', ''), '..', ','), ';;', ',,'), '::', ','),
							'//', ','), '--', ','), '\\', ','), '##', ','),
							'.', ','), ';', ','), ':', ','), '/', ','),
							'-', ','), '\', ','), '#', ','), ',', ', ')
    return @output_string
end;
go
