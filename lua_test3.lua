r1=0.001
r2=0.120
dr=0.01

z1=0.02
z2=0.28
dz=0.01

ni = (r2-r1)/dr+2
nj = (z2-z1)/dz+2

handle=openfile("W.csv","w")
-- write(handle,"r",",","z",",","B","\n")

for j=0,nj-1,1 do
    for i=0,ni-1,1 do
        r=r1+i*dr
        z=z1+j*dz
        A,B1,B2=mo_getpointvalues(r,z)
        C=sqrt(B1*B1+B2*B2) -- 처음엔 MAX의 ? %로 기준을 정하려 했지만 이는 불명확하므로 "어느정도 영향을 끼치는 FLUX FLOW"의 기준을 평범한 상수값으로 정할 필요가 있다.
        -- if (C>0.4) then write(handle,r,",",z,",",sqrt(B1*B1+B2*B2),"\n")--기준으로 무엇을 하든 상관 없음 
        -- end
        if (C>0.3) then 
            -- if (r<0.04) then 
            --     for k=0, C*10, 1 do
            --         write(handle,r,",",z+k*0.001,",",sqrt(B1*B1+B2*B2),"\n")
            -- end
            -- if (r>0.08) then 
            --     for k=0, C*10, 1 do
            --         write(handle,r,",",z-k*0.001,",",sqrt(B1*B1+B2*B2),"\n")
            -- end
            
            if (r<0.04) then
                for k=0, C*10, 1 do
                     write(handle,r*1000,",",z*1000+k,",",sqrt(B1*B1+B2*B2),"\n")
                end
            elseif (r>0.08) then
                for k=0, C*10, 1 do
                     write(handle,r*1000,",",z*1000-k,",",sqrt(B1*B1+B2*B2),"\n")
                end
            else
                for k=0, C*10, 1 do
                    write(handle,r*1000+k,",",z*1000,",",sqrt(B1*B1+B2*B2),"\n")
                end
            end
        
        end

    end
end

closefile(handle)

