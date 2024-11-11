pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
 poke(0x5f2d, 1)
 tiles={}
 apps={}
 buttons={}
 crtile(0,0,2,2,9,64)
 crtile(112,0,1,1,12,68)
 crtile(32,0,2,2,12,70)
 crtile(64,0,1,1,11,74)
 ao=0
 pa=0
end

function _update()
 msx=stat(32)
 msy=stat(33)
 updbtn()
 powersett()
 for mapp in all(apps) do
  for mbut in all(buttons) do
   if mbut.p==1 then
    if mapp.t==1 then
     pa=1
    end
   end
  end
 end
 unp()
 for mapp in all(apps) do
	  if btnp(4) then
	   ao=0
	   del(apps,mapp)
	   del(buttons,mbut)
	 end
 end
 if stat(34)==1 and ao==0 then
  if msx>0 and msx<32 then
   if msy>0 and msy<32 then
    ao=1
    crapp("settings",9)
   end
  end
  if msx>112 and msx<128 then
   if msy>0 and msy<16 then
    ao=2
    crapp("power",9,1)
    crtbtn(40,40,50,10,"shutdown")
   end
  end
  if msx>32 and msx<63 then
   if msy>0 and msy<31 then
    ao=3
    crapp("picocart",9,1)
    --crtbtn(40,40,50,10,"shutdown")
   end
  end
  if msx>64 and msx<79 then
   if msy>0 and msy<15 then
    ao=4
    crapp("getting started ▶",9,1)
    --crtbtn(40,40,50,10,"shutdown")
   end
  end
 end
end

function _draw()
 cls(0)
 drtile()
 drwapp()
 drwbtn()
 spr(0,msx,msy)
end
-->8
--tiles logick
function crtile(x,y,w,h,tcolor,t)
 mtile={}
 mtile.x=x
 mtile.y=y
 mtile.w=w
 mtile.h=h
 mtile.c=tcolor
 mtile.t=t
 add(tiles,mtile)
end

function uptile()
 
end

function drtile()
 for mtile in all(tiles) do
  rectfill(mtile.x,mtile.y,mtile.x+mtile.w*16-1,mtile.y+mtile.h*16-1,mtile.c)
  rect(mtile.x,mtile.y,mtile.x+mtile.w*16-1,mtile.y+mtile.h*16-1,5)
  spr(mtile.t,mtile.x,mtile.y,mtile.w*2,mtile.h*2)
 end
end
-->8
--apps logick
function crapp(n,c,t)
 mapp={}
 mapp.c=c
 mapp.n=n
 mapp.t=t
 add(apps,mapp)
end

function updapp()

end

function drwapp()
 for mapp in all(apps) do
  rectfill(0,0,127,127,6)
  rectfill(0,0,127,7,mapp.c)
  rect(0,0,127,127,5)
  rect(0,0,127,7,5)
  print(mapp.n,2,2,0)
 end
end
-->8
--buttons logick
function crtbtn(bx,by,bw,bh,bt)
 mbut={}
 mbut.x=bx
 mbut.y=by
 mbut.w=bw
 mbut.h=bh
 mbut.t=bt
 mbut.p=0
 add(buttons,mbut)
end

function updbtn()
 if stat(34)==1 then
  for mbut in all(buttons) do
   if msx>mbut.x and msx<mbut.x+mbut.w then
    if msy>mbut.y and msy<mbut.y+mbut.h then
     mbut.p=1
    end
   end
  end
 end
end

function drwbtn()
 for mapp in all(apps) do
	 for mbut in all(buttons) do
	  rectfill(mbut.x,mbut.y,mbut.x+mbut.w-1,mbut.y+mbut.h-1,mapp.c)
	  print(mbut.t,mbut.x+2,mbut.y+2,0)
	 end
	end
end
-->8
--system tools
function powersett()
 if pa==1 then
  cls(5)
  print("shutdown...",50,60,9)
  delay(60)
  _quit()
 end
end

function delay(frames)
 for i = 1, frames do
  flip()  
 end
end

function _quit()
 for mbut in all(buttons) do
  for mapp in all(apps) do
   del(apps,mapp)
   del(buttons,mbut)
   for mtile in all(tiles) do
   del(tiles,mtile)
   end
  end
 end
 pa=0
 reload()
end

function unp()
for mbut in all(buttons) do
 mbut.p=0
end
end
__gfx__
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000055000000000000000000000000000000000000000
00000000000000000000000000000000000000055000000000000000000000000000000000000000000005500550000000000000000000000000000000000000
00000000000000000000000000000000000005055050000000000000000000000000000000000000000050000005000000000000000000000000000000000000
00000000000000000000000000000000000055055055000000000000000000000000000000000000000500000550500000000000000000000000000000000000
00000000000000555000000000000000000550055005500000000000000000000000000000000000000500055050500000000000000000000000000000000000
00000000000000555000000000000000000550055005500000000000000000000000000000000000005000500500050000000000000000000000000000000000
00000000555005555500555000000000000550000005500000000000055555500000000000000000005000500500050000000000000000000000000000000000
00000000555555555555555000000000000550000005500000000000555555550000000000000000000505055000500000000000000000000000000000000000
00000000555555555555555000000000000055000055000000000000555555555555555000000000000505500000500000000000000000000000000000000000
00000000055555555555550000000000000005555550000000000000555555555555555500000000000050000005000000000000000000000000000000000000
00000000055555555555550000000000000000555500000000000000000000000000000000000000000005500550000000000000000000000000000000000000
00000000555555000555555000000000000000000000000000000000555555555555555500000000000000055000000000000000000000000000000000000000
00000055555550000055555550000000000000000000000000000000555555555555555500000000000000000000000000000000000000000000000000000000
00000055555550000055555550000000000000000000000000000000555555555555555500000000000000000000000000000000000000000000000000000000
00000055555550000055555550000000000000000000000000000000555555555555555500000000000000000000000000000000000000000000000000000000
00000000555555000555555000000000000000000000000000000000555555555555555500000000000000000000000000000000000000000000000000000000
00000000055555555555550000000000000000000000000000000000555555555555555500000000000000000000000000000000000000000000000000000000
00000000055555555555550000000000000000000000000000000000555555555555555500000000000000000000000000000000000000000000000000000000
00000000555555555555555000000000000000000000000000000000555555555555555500000000000000000000000000000000000000000000000000000000
00000000555555555555555000000000000000000000000000000000055555555555555000000000000000000000000000000000000000000000000000000000
00000000555005555500555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
