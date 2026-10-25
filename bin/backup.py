import os,sys,zipfile,time
ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
B=os.path.join(ROOT,'backup'); os.makedirs(B,exist_ok=True)
name='union_'+time.strftime('%Y%m%d_%H%M%S')+'.zip'
out=os.path.join(B,name)
with zipfile.ZipFile(out,'w',zipfile.ZIP_DEFLATED) as z:
    for dp,dn,fn in os.walk(ROOT):
        if os.path.abspath(dp).startswith((os.path.join(ROOT,'backup'),os.path.join(ROOT,'logs'))): continue
        for f in fn:
            p=os.path.join(dp,f)
            z.write(p,os.path.relpath(p,ROOT))
print('backup:',out)
