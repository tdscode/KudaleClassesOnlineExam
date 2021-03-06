USE [onlineexam]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [nvarchar](50) NULL,
	[admin_email] [nvarchar](50) NULL,
	[admin_password] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[exam]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_name] [nvarchar](500) NULL,
	[exam_description] [nvarchar](max) NULL,
	[exam_date] [date] NOT NULL,
	[exam_duration] [int] NULL,
	[exam_marks] [int] NULL,
	[exam_negativemarks] [int] NULL,
	[exam_totalquestion] [int] NULL,
	[category_fid] [int] NULL,
	[subject_fid] [int] NULL,
	[exampass_marks] [int] NULL,
 CONSTRAINT [PK_exam] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[question]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[question_name] [nvarchar](max) NULL,
	[option_one] [nvarchar](max) NULL,
	[option_two] [nvarchar](max) NULL,
	[option_three] [nvarchar](max) NULL,
	[option_four] [nvarchar](max) NULL,
	[question_answer] [int] NULL,
	[exam_fid] [int] NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[result]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[result_status] [nvarchar](50) NULL,
	[result_score] [int] NULL,
	[user_email] [nvarchar](50) NULL,
	[totalquestion] [int] NULL,
	[exam_fid] [int] NULL,
	[exam_date] [date] NULL,
 CONSTRAINT [PK_result] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student_details]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_details](
	[stud_id] [int] NOT NULL,
	[stud_name] [char](20) NULL,
	[stud_email] [nvarchar](50) NULL,
	[stud_mob] [bigint] NULL,
	[category_id] [int] NULL,
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_id] [nvarchar](20) NULL,
 CONSTRAINT [PK_student_details] PRIMARY KEY CLUSTERED 
(
	[stud_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subject]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name] [nvarchar](50) NULL,
	[category_fid] [int] NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teacher_details]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teacher_details](
	[teacher_id] [int] NOT NULL,
	[teacher_name] [char](20) NULL,
	[teacher_std] [int] NULL,
	[teacher_sub_id] [int] NULL,
	[teacher_email] [nvarchar](20) NULL,
	[teacher_mobile] [int] NULL,
	[user_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_teacher_details] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_fname] [nvarchar](50) NULL,
	[user_lname] [nvarchar](50) NULL,
	[user_email] [nvarchar](50) NULL,
	[user_password] [nvarchar](100) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin] ON 

GO
INSERT [dbo].[admin] ([admin_id], [admin_name], [admin_email], [admin_password]) VALUES (1, N'admin', N'admin@gmail.com', N'12345')
GO
INSERT [dbo].[admin] ([admin_id], [admin_name], [admin_email], [admin_password]) VALUES (2, N'admin2', N'admin2@gmail.com', N'123')
GO
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

GO
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'Class 11')
GO
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'Class 12')
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[exam] ON 

GO
INSERT [dbo].[exam] ([exam_id], [exam_name], [exam_description], [exam_date], [exam_duration], [exam_marks], [exam_negativemarks], [exam_totalquestion], [category_fid], [subject_fid], [exampass_marks]) VALUES (1, N'Math Exam For Students', N'This is math exam ', CAST(N'2018-03-07' AS Date), 10, 5, NULL, NULL, 2, 3, 3)
GO
INSERT [dbo].[exam] ([exam_id], [exam_name], [exam_description], [exam_date], [exam_duration], [exam_marks], [exam_negativemarks], [exam_totalquestion], [category_fid], [subject_fid], [exampass_marks]) VALUES (2, N'CET 2019 Physics', N'Its Practice Test', CAST(N'2019-07-14' AS Date), 30, 20, NULL, NULL, 6, 11, 10)
GO
INSERT [dbo].[exam] ([exam_id], [exam_name], [exam_description], [exam_date], [exam_duration], [exam_marks], [exam_negativemarks], [exam_totalquestion], [category_fid], [subject_fid], [exampass_marks]) VALUES (3, N'tst examtst', N'test', CAST(N'2019-07-03' AS Date), 30, 20, NULL, NULL, 6, 12, 10)
GO
INSERT [dbo].[exam] ([exam_id], [exam_name], [exam_description], [exam_date], [exam_duration], [exam_marks], [exam_negativemarks], [exam_totalquestion], [category_fid], [subject_fid], [exampass_marks]) VALUES (1003, N'Maths Lockdown', N'Exam TEst', CAST(N'2020-07-23' AS Date), 30, 20, NULL, NULL, 7, 15, 10)
GO
SET IDENTITY_INSERT [dbo].[exam] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

GO
INSERT [dbo].[question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid]) VALUES (2, N'2a+3a = ?', N'10a', N'6a', N'5a', N'a', 3, 1)
GO
INSERT [dbo].[question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid]) VALUES (3, N'5 + 2 = ?', N'7', N'3', N'5', N'1', 1, 1)
GO
INSERT [dbo].[question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid]) VALUES (4, N'10*10 = ?', N'10', N'1000', N'100', N'20', 3, 1)
GO
INSERT [dbo].[question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid]) VALUES (5, N'b+b = ?', N'2b', N'3b', N'4b', N'5b', 1, 1)
GO
INSERT [dbo].[question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid]) VALUES (6, N'Test 1', N'1', N'2', N'3', N'4', 1, 2)
GO
INSERT [dbo].[question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid]) VALUES (7, N'Question 2', N'23', N'24', N'25', N'26', 2, 2)
GO
INSERT [dbo].[question] ([question_id], [question_name], [option_one], [option_two], [option_three], [option_four], [question_answer], [exam_fid]) VALUES (8, N'../assets/image/QuestionBrides.png', N'../assets/image/QuestionContact us.png', N'../assets/image/QuestionDisclaimerRules.png', N'../assets/image/QuestionMagzine.png', N'../assets/image/QuestionOnline Payment.png', 2, 2)
GO
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[result] ON 

GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (12, N'Fail', 2, N'farhad@gmail.com', 5, 1, CAST(N'2018-03-05' AS Date))
GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (13, N'Fail', 1, N't@t.com', 5, 1, CAST(N'2019-07-13' AS Date))
GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (14, N'Fail', 2, N't@t.com', 4, 1, CAST(N'2019-07-13' AS Date))
GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (15, N'Fail', 1, N't@t.com', 2, 2, CAST(N'2019-07-14' AS Date))
GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (16, N'Fail', 1, N'raju@as.com', 2, 2, CAST(N'2019-07-16' AS Date))
GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (17, N'Fail', 2, N'raju@as.com', 2, 2, CAST(N'2019-07-17' AS Date))
GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (1016, N'Fail', 0, N'raju@as.com', 3, 2, CAST(N'2019-11-09' AS Date))
GO
INSERT [dbo].[result] ([result_id], [result_status], [result_score], [user_email], [totalquestion], [exam_fid], [exam_date]) VALUES (1017, N'Fail', 3, N'raju@as.com', 3, 2, CAST(N'2019-11-09' AS Date))
GO
SET IDENTITY_INSERT [dbo].[result] OFF
GO
SET IDENTITY_INSERT [dbo].[student_details] ON 

GO
INSERT [dbo].[student_details] ([stud_id], [stud_name], [stud_email], [stud_mob], [category_id], [user_id], [subject_id]) VALUES (1, N'tejas asda          ', N'as1@as.com', 9999999999, 6, 2, N'11,12,13')
GO
INSERT [dbo].[student_details] ([stud_id], [stud_name], [stud_email], [stud_mob], [category_id], [user_id], [subject_id]) VALUES (2, N'raju new            ', N'raju@as.com', 9999999999, 6, 3, N'11,12,13')
GO
SET IDENTITY_INSERT [dbo].[student_details] OFF
GO
SET IDENTITY_INSERT [dbo].[subject] ON 

GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [category_fid]) VALUES (11, N'Physics', 6)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [category_fid]) VALUES (12, N'Chemistry', 6)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [category_fid]) VALUES (13, N'Mathematics', 6)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [category_fid]) VALUES (14, N'Physics', 7)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [category_fid]) VALUES (15, N'Chemistry', 7)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [category_fid]) VALUES (16, N'Mathematics', 7)
GO
SET IDENTITY_INSERT [dbo].[subject] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

GO
INSERT [dbo].[users] ([user_id], [user_fname], [user_lname], [user_email], [user_password]) VALUES (2, N'test', N'teste', N'test@test.com', N'123456')
GO
INSERT [dbo].[users] ([user_id], [user_fname], [user_lname], [user_email], [user_password]) VALUES (3, N'test', N'teste', N't@t.com', N'12345')
GO
INSERT [dbo].[users] ([user_id], [user_fname], [user_lname], [user_email], [user_password]) VALUES (1002, N'asda', N'asd', N'as@as.com', N'123')
GO
INSERT [dbo].[users] ([user_id], [user_fname], [user_lname], [user_email], [user_password]) VALUES (1003, N'tejas', N'asda', N'as1@as.com', N'123')
GO
INSERT [dbo].[users] ([user_id], [user_fname], [user_lname], [user_email], [user_password]) VALUES (1004, N'raju', N'new', N'raju@as.com', N'123')
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_exam] FOREIGN KEY([exam_fid])
REFERENCES [dbo].[exam] ([exam_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_exam]
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [FK_result_exam] FOREIGN KEY([exam_fid])
REFERENCES [dbo].[exam] ([exam_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [FK_result_exam]
GO
ALTER TABLE [dbo].[subject]  WITH CHECK ADD  CONSTRAINT [FK_subject_category] FOREIGN KEY([category_fid])
REFERENCES [dbo].[category] ([category_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subject] CHECK CONSTRAINT [FK_subject_category]
GO
/****** Object:  StoredProcedure [dbo].[spaddexam]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spaddexam]
@examname nvarchar(500),
@examdis nvarchar(MAX),
@examdate date,
@examduration int,
@exampassmarks int,
@exammarks int,
@examsubjectfid int,
@examcategoryfid int
as
begin
	insert into exam (exam_name,exam_description,exam_date,exam_duration,exampass_marks,exam_marks,subject_fid,category_fid) values 
	(@examname,@examdis,@examdate,@examduration,@exampassmarks,@exammarks,@examsubjectfid,@examcategoryfid)
end
GO
/****** Object:  StoredProcedure [dbo].[spAddquestion]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAddquestion]
@questionname nvarchar(MAX),
@optionone nvarchar(MAX),
@optiontwo nvarchar(MAX),
@optionthree nvarchar(MAX),
@optionfour nvarchar(MAX),
@questionanswer int,
@examfid int
as
begin
	insert into question (question_name,option_one,option_two,option_three,option_four,question_answer,exam_fid) values
	(@questionname,@optionone,@optiontwo,@optionthree,@optionfour,@questionanswer,@examfid)
end
GO
/****** Object:  StoredProcedure [dbo].[spAdminlogin]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spAdminlogin] 
@admin_email nvarchar(50),
@password nvarchar(100)
as
begin
	Declare @count int
	select @count = COUNT(admin_email) from admin 
	where admin_email = @admin_email and admin_password = @password
	if (@count = 1)
		begin
			select 1 as retunvalue 
		end
	else
		begin
			select -1 as retunvalue
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spAdminRegisterinsert]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spAdminRegisterinsert]
@admin_name nvarchar(50),
@email nvarchar(50),
@password nvarchar(100)
as
begin
declare @count int
declare @returnvalue int
select @count = COUNT(admin_email) from admin where admin_email = @email
	if @count > 0 
		begin
			set @returnvalue = -1
		end
	else
		begin
			set @returnvalue = 1
			insert into admin(admin_name,admin_email,admin_password)
			values (@admin_name,@email,@password)
		end
	select @returnvalue as retrunvalue
	end
GO
/****** Object:  StoredProcedure [dbo].[spEditexam]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spEditexam]
@examid int,
@examname nvarchar(100),
@examdiscription nvarchar(MAX),
@examdate date,
@examduration int,
@exampassmarks int,
@examnmarks int,
@categoryfid int,
@subjectfid int
as
begin
update exam set exam_name = @examname, exam_description = @examdiscription, exam_date = @examdate, exam_duration = @examduration , exampass_marks =  @exampassmarks, exam_marks = @examnmarks, category_fid = @categoryfid, subject_fid=@subjectfid 
where exam_id = @examid
end
GO
/****** Object:  StoredProcedure [dbo].[spEditexamfill]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spEditexamfill]
@examid int
as
begin
	select * from exam where exam_id = @examid
end
GO
/****** Object:  StoredProcedure [dbo].[spEditquestion]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spEditquestion]
@questionid int,
@questionname nvarchar(MAX),
@optionone nvarchar(MAX),
@optiontwo nvarchar(MAX),
@optionthree nvarchar(MAX),
@optionfour nvarchar(MAX),
@questionanswer int,
@examfid int
as
begin
	update question set question_name =@questionname ,option_one = @optionone,option_two = @optiontwo,option_three = @optionthree ,option_four = @optionfour,question_answer = @questionanswer,exam_fid = @examfid
	where question_id = @questionid
end
GO
/****** Object:  StoredProcedure [dbo].[spEditquestionfill]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spEditquestionfill]
@questionid int
as
begin
	select * from question
	left join exam on
	question.exam_fid = exam.exam_id
	where question_id = @questionid
end
GO
/****** Object:  StoredProcedure [dbo].[spExamList]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spExamList]
as
begin
	select * from exam
	left join subject on exam.subject_fid = subject.subject_id
	left join category on exam.category_fid = category.category_id
end
GO
/****** Object:  StoredProcedure [dbo].[spExamListDetails]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spExamListDetails] 
@exam_id int
as
begin
	select * from exam
	left join subject on exam.subject_fid = subject.subject_id
	left join category on exam.category_fid = category.category_id
	where exam_id = @exam_id
end
GO
/****** Object:  StoredProcedure [dbo].[spExamquestion]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spExamquestion]
@examfid int
as
begin
	select * from question
	left join exam on
	question.exam_fid = exam.exam_id
	where exam_fid = @examfid
end
GO
/****** Object:  StoredProcedure [dbo].[spExamserachcategory]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spExamserachcategory]
@subjectid int
as
begin
select * from subject
join exam 
on
subject.subject_id = exam.subject_fid  
where subject_id = @subjectid
end
GO
/****** Object:  StoredProcedure [dbo].[spgetallquestion]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgetallquestion]
as
begin
	select * from question
	left join exam on
	question.exam_fid = exam.exam_id
end
GO
/****** Object:  StoredProcedure [dbo].[spQuestionserachexam]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spQuestionserachexam]
@examid int,
@startRowIndex int,
@maximumRows int, 
@totalRows int OUTPUT

AS

DECLARE @first_id int, @startRow int

SET @startRowIndex =  (@startRowIndex - 1)  * @maximumRows

IF @startRowIndex = 0 
SET @startRowIndex = 1

SET ROWCOUNT @startRowIndex
print @startRowIndex
SELECT @first_id = question_id FROM question where exam_fid = @examid ORDER BY question_id

PRINT @first_id

SET ROWCOUNT @maximumRows

select question_id,question_name,option_one,option_two,option_three,option_four,question_answer,exam_fid,exam_id,exam_name,exam_description,exam_date,exam_duration,exam_marks,exam_negativemarks,exam_totalquestion,category_fid,subject_fid,exampass_marks from question
join exam 
on
exam.exam_id = question.exam_fid  
where exam_fid = @examid and question_id = @first_id
 
SET ROWCOUNT 0

-- GEt the total rows 

SELECT @totalRows = COUNT(question_id) FROM question where exam_fid = @examid

GO
/****** Object:  StoredProcedure [dbo].[spResultinsert]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[spResultinsert]
 @examfid nvarchar(150),
 @resultstatus nvarchar(50),
 @resultscore int,
 @totalquestion int,
 @username nvarchar(50),
 @examdate date
 as
 begin
 insert into result (exam_fid, result_status,result_score, totalquestion, user_email, exam_date) values
  (@examfid, @resultstatus,@resultscore,@totalquestion, @username, @examdate)
 end
GO
/****** Object:  StoredProcedure [dbo].[spSubjectedit]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSubjectedit] 
@subject_name nvarchar(50),
@category_id int,
@subject_id int
as 
begin
 update subject set subject_name = @subject_name, category_fid = @category_id where subject_id = @subject_id
end
GO
/****** Object:  StoredProcedure [dbo].[spSubjecteditfill]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSubjecteditfill]
@id int
as
begin
select * from subject 
left join category 
on
subject.category_fid = category.category_id where subject_id= @id
end
GO
/****** Object:  StoredProcedure [dbo].[spSubjectList]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spSubjectList]
as
begin
select * from subject 
left join category 
on
subject.category_fid = category.category_id
end
GO
/****** Object:  StoredProcedure [dbo].[spUserresult]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUserresult]
@email nvarchar(50)
as
begin
select * from result 
join exam
on 
result.exam_fid = exam.exam_id
where user_email = @email
end
GO
/****** Object:  StoredProcedure [dbo].[spUserslogin]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spUserslogin] 
@user_email nvarchar(50),
@password nvarchar(100)
as
begin
	Declare @count int
	select @count = COUNT(user_email) from users 
	where user_email = @user_email and user_password = @password
	if (@count = 1)
		begin
			select 1 as retunvalue 
		end
	else
		begin
			select -1 as retunvalue
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spUsersRegisterinsert]    Script Date: 7/23/2020 10:01:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUsersRegisterinsert]
@user_fname nvarchar(50),
@user_lname nvarchar(50),
@email nvarchar(50),
@password nvarchar(100),
@sub_id nvarchar(50),
@mobile_no bigint,
@stud_std int

as
begin
declare @count int
declare @returnvalue int
select @count = COUNT(user_email) from users where user_email = @email
	if @count > 0 
		begin
			set @returnvalue = -1
		end
	else
		begin
			set @returnvalue = 1
			insert into users (user_fname,user_lname,user_password,user_email)
			values (@user_fname,@user_lname,@password,@email)
			insert into student_details(stud_id,stud_name,stud_email,stud_mob,category_id,subject_id)
			values ((select ISNULL(max(stud_id)+1,1) from student_details),@user_fname +' '+@user_lname,@email,@mobile_no,@stud_std,@sub_id)
		end
	select @returnvalue as retrunvalue
	end
GO
