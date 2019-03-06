# auther: gaopeng
# version: python3
import os

file_path = 'F:\gpnote\工作相关'
parent_name = '工作相关'

for root, dirs, files in os.walk(file_path):
    for f in files:
        # - [测试环境 -- redis哨兵配置及启动脚本](工作相关/NO4--Redis启动.md)
        print('- [%s](%s/%s)' % (f, parent_name, f))
