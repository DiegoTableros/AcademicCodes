int64 n;
int64 q;
int64 r;
n=input('n: ');
q=1;
r=0;
bit=[];
while(q~=0)
    q=n/2;
    r=rem(n,2);
    bit=[r,bit];
    n=n/2;
end
disp(bit);