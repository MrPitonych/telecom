clc;
close all;
clear all;

%BPSK
%���������� ��������� ���������
msg=randi([0 1], [1 256]);
%M=2 ������� ������ �� ��������� �������� ����������
sig_mod=pskmod(msg,2);
%������� ���������� ��������� BPSK
scatterplot(sig_mod);
%������ ������������������
%����������� ������
errors=randerr(1,256,13);
%������� ������ � �������
sig_mod_errors=(sig_mod+errors);
%���������� ������
sig_demod=pskdemod(sig_mod_errors,2);
%�������� ����� ��������� �������� 
%� ����������� ������ �� ������
[numberBPSK, ratioBPSK]=symerr(msg,sig_demod);
[BITnumberBPSK, BITratioBPSK]=biterr(msg,sig_demod);
%����� ��������� ��������
numberBPSK
%����������� ������ �� ������
ratioBPSK

%PSK
%���������� ��������� ���������
msg=randi([0 7], [1 256]);
%M=8 ������� ������ �� ��������� �������� ����������
sig_mod=pskmod(msg,8);
%������� ���������� ��������� BPSK
scatterplot(sig_mod);
%������ ������������������
%����������� ������
errors=randerr(1,256,13);
%������� ������ � �������
sig_mod_errors=sig_mod+errors;
%���������� ������
sig_demod=pskdemod(sig_mod_errors,8);
%�������� ����� ��������� �������� 
%� ����������� ������ �� ������
[numberPSK, ratioPSK]=symerr(msg,sig_demod);
[BITnumberPSK, BITratioPSK]=biterr(msg,sig_demod);
%����� ��������� ��������
numberPSK
%����������� ������ �� ������
ratioPSK

%OQPSK
%���������� ��������� ���������
msg=randi([0 3], [1 256]);
%M=4 ������� ������ �� ��������� �������� ����������
%������ ini_phase ������ ��������� 
%���� ����������� ��������� � ��������
sig_mod=oqpskmod(msg,pi/2);
%������� ���������� ��������� BPSK
scatterplot(sig_mod);
%������ ������������������
%����������� ������
errors=randerr(1,513,13);
%������� ������ � �������
sig_mod_errors=sig_mod+errors;
%���������� ������
sig_demod=oqpskdemod(sig_mod_errors,pi/2);
%�������� ����� ��������� �������� 
%� ����������� ������ �� ������
[numberOQPSK, ratioOQPSK]=symerr(msg,sig_demod);
%����� ��������� ��������
numberOQPSK
%����������� ������ �� ������
ratioOQPSK


%genQAM
%���������� ��������� ���������
M=8;
msg=randi([0 M-1], [1 256]);
%M=8 ������� ������ �� ��������� �������� ����������
sig_mod=genqammod(msg,exp(j*[0:M-1]));
%������� ���������� ��������� BPSK
scatterplot(sig_mod);
%������ ������������������
%����������� ������
errors=randerr(1,256,13);
%������� ������ � �������
sig_mod_errors=sig_mod+errors;
%���������� ������
sig_demod=genqamdemod(sig_mod_errors,exp(j*[0:M-1]));
%�������� ����� ��������� �������� 
%� ����������� ������ �� ������
[numbergenQAM, ratiogenQAM]=symerr(msg,sig_demod);
[BITnumbergenQAM, BITratiogenQAM]=biterr(msg,sig_demod);
%����� ��������� ��������
numbergenQAM
%����������� ������ �� ������
ratiogenQAM

%MSK
%���������� ��������� ���������
%�������� ������� ���������� ����� ��������� 1 ��� 0
msg=randi([0 1], [1 256]);
%M=2 ������� ������ �� ��������� �������� ����������
%������ �������� - ����� �������� ���.�������
sig_mod=mskmod(msg,16);
%������� ���������� ��������� BPSK
scatterplot(sig_mod);
%������ ������������������
%����������� ������
errors=randerr(1,256*16,13);
%������� ������ � �������
sig_mod_errors=sig_mod+errors;
%���������� ������
sig_demod=mskdemod(sig_mod_errors,16);
%�������� ����� ��������� �������� 
%� ����������� ������ �� ������
[numberMSK, ratioMSK]=symerr(msg,sig_demod);
%����� ��������� ��������
numberMSK
%����������� ������ �� ������
ratioMSK

%FSK
%���������� ��������� ���������
%�������� ������� ���������� ����� ��������� 1 ��� 0
msg=randi([0 1], [1 256]);
%M=2 ������� ������ �� ��������� �������� ����������
%������ �������� - ����� �������� ���.�������
M=2; % ����� ������� �����������
freqsep=4; % ������ ������ ����������� (� ������)
nsamp=4; % ����� �������� �� ������
Fs=32; % ������� ������������� (� ������)
sig_mod=fskmod(msg,M,freqsep,nsamp,Fs);
%������� ���������� ��������� BPSK
scatterplot(sig_mod);
%������ ������������������
%����������� ������
errors=randerr(1,256*nsamp,13);
%������� ������ � �������
sig_mod_errors=sig_mod+errors;
%���������� ������
sig_demod=fskdemod(sig_mod_errors,M,freqsep,nsamp,Fs);
%�������� ����� ��������� �������� 
%� ����������� ������ �� ������
[numberFSK, ratioFSK]=symerr(msg,sig_demod);
%����� ��������� ��������
numberFSK
%����������� ������ �� ������
ratioFSK

