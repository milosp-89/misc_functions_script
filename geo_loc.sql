-- function for extracting geo locations (lang/long)

use [xxx]
go;

create function [dbo].[geo_loc] (
  @column nvarchar(max),
	@position tinyint,
	@value nvarchar(50))
returns nvarchar(max)
as
begin
	declare @output_string nvarchar(max)
	set @output_string = 
	replace(
		reverse(
		replace(
		parsename(
		replace(
		replace(
		reverse(@column),
		'.', '_'), ',', '.'), @position), '_', '.')),  @value, '')

return @output_string
end;
go
