import os,sys,zipfile,glob
ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
B=os.path.join(ROOT,'backup')
idx=int(sys.argv[1]) if len(sys.argv)>1 else 1
files=sorted(glob.glob(os.path.join(B,'*.zip')),key=os.path.getmtime,reverse=True)
if not files: print('no backup'); sys.exit(1)
f=files[idx-1]
print('rollback:',f)
with zipfile.ZipFile(f) as z: z.extractall(ROOT)
print('done')
