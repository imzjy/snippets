@set curdate=%date:~10,4%%date:~4,2%%date:~7,2%%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%
@echo ####Start####-------Date:%curdate%--------

@set anwser_tmp_filename="D:\BCC\Archive\dbo.TBL_ANSWER_TMP_%curdate%.dat"
@set respondent_tmp_filename="D:\BCC\Archive\dbo.TBL_RESPONDENT_TMP_%curdate%.dat"
@set event_log_filename="D:\BCC\archive\dbo.TBL_EVENTLOG_%curdate%.dat"
@set client_info_filename="D:\BCC\archive\dbo.TBL_CLIENTINFO_%curdate%.dat"



bcp.exe "[BCC_CNB].[dbo].[TBL_ANSWER_TMP]" out %anwser_tmp_filename% -E -n -S ip-or-domain-name -U "user" -P password

bcp.exe "[BCC_CNB].[dbo].[TBL_RESPONDENT_TMP]" out %respondent_tmp_filename% -E -n -S ip-or-domain-name -U "user" -P password

bcp.exe "[BCC_CNB].[dbo].[TBL_EVENTLOG]" out %event_log_filename% -E -n -S ip-or-domain-name -U "user" -P password

bcp.exe "[BCC_CNB].[dbo].[TBL_CLIENTINFO]" out %client_info_filename% -E -n -S ip-or-domain-name -U "user" -P password


