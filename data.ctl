{"version":2,"type":"import","id":"9970a437-f38c-4a30-830f-e41353d90d86","name":"Import Data 2","label":"Import Data 2","description":"","created":1651503464310,"modified":1651503580977,"notes":"","parameters":{"server":"","target":"com.sas.ep.sascoder.execution.producers.VPP","action":"runSASCode","priority":"Reserved","code":"/* Generated Code (IMPORT) */\r\n/* Source File: data.csv */\r\n/* Source Path: /home/u57888155/my_shared_file_links/u57888155/project */\r\n/* Code generated on: 5/2/22, 3:59 PM */\r\n\r\n%web_drop_table(WORK.project);\r\n\r\n\r\nFILENAME REFFILE '/home/u57888155/my_shared_file_links/u57888155/project/data.csv';\r\n\r\nPROC IMPORT DATAFILE=REFFILE\r\n\tDBMS=CSV\r\n\tOUT=WORK.project;\r\n\tGETNAMES=NO;\r\n\tDATAROW=2;\r\nRUN;\r\n\r\nPROC CONTENTS DATA=WORK.project; RUN;\r\n\r\n\r\n%web_open_table(WORK.project);","resource":false,"outputType":"TABLE","outputName":"project","outputLocation":"WORK","fileName":"data.csv","filePath":"/home/u57888155/my_shared_file_links/u57888155/project","fileType":"CSV","fileSheet":"","fileTable":"","delimiterOption":"","dataRowOption":2,"guessingRowsOption":-1,"getnamesOption":false,"quoteDelimiterOption":true,"eolDelimiterOption":""},"properties":{"left":"20","top":"20","width":"100","height":"60","region":"output","fillcolor":"#E0E6F1","linecolor":"#6882a3","tooltip":"","portsonly":false,"key":"control","visible":true}}