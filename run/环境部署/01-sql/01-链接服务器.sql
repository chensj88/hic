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

--###############上海儿童医院测试库###################################
--HIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_HIS','','SQLOLEDB','192.16.201.151'
exec sp_addlinkedsrvlogin 'HLHT_ZY_HIS','false',null,'sa','Etyy-2016'
--HIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_HIS','','SQLOLEDB','192.16.201.151'
exec sp_addlinkedsrvlogin 'HLHT_MZ_HIS','false',null,'sa','Etyy-2016'
--CIS链接服务器服务器 住院
exec sp_addlinkedserver 'HLHT_ZY_CIS','','SQLOLEDB','192.16.201.151'
exec sp_addlinkedsrvlogin 'HLHT_ZY_CIS','false',null,'sa','Etyy-2016'
--CIS链接服务器服务器 门诊
exec sp_addlinkedserver 'HLHT_MZ_CIS','','SQLOLEDB','192.16.201.151'
exec sp_addlinkedsrvlogin 'HLHT_MZ_CIS','false',null,'sa','Etyy-2016'