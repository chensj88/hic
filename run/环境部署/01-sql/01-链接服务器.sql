--#########################链接服务器#######################
--HIS链接服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'sa','123456'
--HIS链接服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'sa','123456'
--CIS链接服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_CIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_ZY_CIS','false',null,'sa','123456'
--CIS链接服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_CIS','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'HLHT_MZ_CIS','false',null,'sa','123456'