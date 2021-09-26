info = audioinfo('Breath_signal.wav');
[y1,Fs] = audioread('Breath_signal.wav');
%sound(y,Fs);
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
figure(1)
subplot(2,1,1)
plot(t,y1)
xlabel('Time')
ylabel('Audio Signal')
Ny1=length(y1);
ncs=floor(Ny1/24);
nov=floor(ncs/2);
nfft = 2^nextpow2(ncs);
subplot(2,1,2)
spectrogram(y1(:,1),hamming(ncs),nov,nfft,Fs,'yaxis');

info = audioinfo('Audio_record.wav');
[y2,Fs2] = audioread('Audio_record.wav');
%sound(y,Fs);
t = 0:seconds(1/Fs2):seconds(info.Duration);
t = t(1:end-1);
figure(2)
subplot(2,1,1)
plot(t,y2)
xlabel('Time')
ylabel('Audio Signal')
Ny2=length(y2);
ncs=floor(Ny2/24);
nov=floor(ncs/2);
nfft = 2^nextpow2(ncs);
subplot(2,1,2)
spectrogram(y2(:,1),hamming(ncs),nov,nfft,Fs2,'yaxis');

A=1;
Fs3=10000;
T=1/Fs3;
tmax=20;
N=tmax/T;
t=0:T:tmax-T;
F=0:1:20;
k=1;
m=1;
for i=1:N
y3(i)=A*sin(2*pi*F(m)*t(i));
k=k+1;
if k==10000
    m=m+1;
    k=1;
end
end
figure(3)
subplot(2,1,1)
plot(t,y3)
Ny3=N;
ncs=floor(Ny3/1000);
nov=floor(ncs/2);
nfft = 2^nextpow2(ncs);
subplot(2,1,2)
spectrogram(y3,hamming(ncs),nov,nfft,Fs3,'yaxis');



