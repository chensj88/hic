--#########################浙江省中#######################
--HIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','129.9.1.68'  
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'ssa','20031118' 
--HIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','129.9.1.68'  
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'ssa','20031118'
--#########################公司服务器#######################
--HIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','172.16.0.200\ssgj'
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'sa','zyc@8468'
--HIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','172.16.0.200\ssgj'
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'sa','zyc@8468'
--###############内蒙古人民医院###################################
--HIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','18.5.1.159\EJZ'
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'sa','winning'
--HIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','18.5.1.159\EJZ'
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'sa','winning'
--CIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_CIS','','SQLOLEDB','18.5.1.159\EJZ'
exec sp_addlinkedsrvlogin 'HLHT_ZY_CIS','false',null,'sa','winning'
--CIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_CIS','','SQLOLEDB','18.5.1.159\EJZ'
exec sp_addlinkedsrvlogin 'HLHT_MZ_CIS','false',null,'sa','winning'
--本地
--HIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'sa','123456'
--HIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'sa','123456'
--CIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_CIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_ZY_CIS','false',null,'sa','123456'
--CIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_CIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_MZ_CIS','false',null,'sa','123456'