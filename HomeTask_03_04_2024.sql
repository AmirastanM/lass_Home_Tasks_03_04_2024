create database CourseDataBase

use CourseDataBase

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Surname] nvarchar(50),
[Email] nvarchar(100),
[Address] nvarchar(200)
)



create procedure usp_createStudents
@name nvarchar(50),
@surname nvarchar(50),
@email nvarchar(100),
@address nvarchar(200)
as
begin
	insert into Students([Name],[Surname],[Email],[Address])
	values(@name, @surname, @email, @address)
end;

exec usp_createStudents 'Ayxan', 'Mamedov', 'ayxan@gmail.com', 'Yasamal'

select * from Students

create procedure usp_deleteStudentById
@id int
as
begin
	delete from Students where [Id] = @id

end

exec usp_deleteStudentById 2



create table archiveDeleteStudentLogs (
	[Id] int primary key identity(1,1),
    [StudentId] int,
    [Name] nvarchar(50),
    [Surname] nvarchar(50),
    [Operation] nvarchar(20),
    [Date] datetime
) 


create trigger trg_deleteStudentLogs on Students
after delete
as
begin
    insert into archiveDeleteStudentLogs ([StudentId], [Name], [Surname], [Operation], [Date])
    select [Id], [Name], [Surname], 'Delete', GETDATE() from deleted
   
end

select * from Students

select * from archiveDeleteStudentLogs

exec usp_deleteStudentById 4


exec usp_createStudents 'Ali', 'Aliyev','ali@gmail.com',28
