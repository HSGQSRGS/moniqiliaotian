import os,sys,re
ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
P=sys.argv[1] if len(sys.argv)>1 else '8080'
total=pages=res=0
bad=0
KEY=re.compile(r'TransparentLC|yydsym|源码网|51\.la|易乐游|1355383870|41661|xsymw|keleyi|thanatopsic|sentsin|iframework|akarin|meiqia|nmbxd|zhihu')
for dp,dn,fn in os.walk(ROOT):
    for f in fn:
        total+=1
        if f.endswith('.html'): pages+=1
        if os.path.splitext(f)[1].lower() in ('.html','.js','.css','.php'):
            try:
                if KEY.search(open(os.path.join(dp,f),encoding='utf-8',errors='ignore').read()): bad+=1
            except Exception: pass
run=0
try:
    for pid in os.listdir('/proc'):
        if not pid.isdigit(): continue
        try: c=open('/proc/%s/cmdline'%pid,'rb').read().decode('utf-8','ignore')
        except Exception: continue
        if 'http.server' in c and P in c: run+=1
except Exception: pass
print('联盟 文件 %d 页面 %d 端口 %s 进程 %d 残留 %d'%(total,pages,P,run,bad))
print('Lion')
