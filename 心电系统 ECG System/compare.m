function varargout = compare(varargin)
% COMPARE MATLAB code for compare.fig
%      COMPARE, by itself, creates a new COMPARE or raises the existing
%      singleton*.
%
%      H = COMPARE returns the handle to a new COMPARE or the handle to
%      the existing singleton*.
%
%      COMPARE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARE.M with the given input arguments.
%
%      COMPARE('Property','Value',...) creates a new COMPARE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compare_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compare_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compare

% Last Modified by GUIDE v2.5 24-Jun-2014 21:39:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @compare_OpeningFcn, ...
                   'gui_OutputFcn',  @compare_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before compare is made visible.
function compare_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compare (see VARARGIN)

% Choose default command line output for compare
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compare wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compare_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val;
global out;
val=get(hObject,'Value');
p=ecg(500)';
ECG=[p;p;p;p;p;p];
load('MIT_ECG.MAT');
M_ECG=MIT_ECG;
FS=360;i=1:3000;
noise1=sin(2*pi*0.5* i/FS);
noise2=sin(2*pi*50* i/FS);
switch val
    case 1
    case 2
        out=ECG;
    case 3
        out=ECG+noise1';
    case 4
        out=ECG+noise2';
    case 5
        out=M_ECG;
    case 6
        out=ECG+noise1'+noise2';
end
        

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val;
global out;
switch val
    case 1
    case 2
        axes(handles.axes1)
        cla;
        plot(out),title('纯净信号','Color','r','FontSize',10);
    case 3
        axes(handles.axes2)
        cla;
        plot(out),title('基线漂移干扰信号','Color','r','FontSize',10);
    case 4
        axes(handles.axes3)
        cla;
        plot(out),title('工频干扰信号','Color','r','FontSize',10);
    case 5
        axes(handles.axes1)
        cla;
        plot(out),title('肌电干扰信号','Color','r','FontSize',10);
    case 6
        axes(handles.axes2)
        cla;
        plot(out),title('所有噪声干扰信号','Color','r','FontSize',10);
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val;
global out;
i=1:3000;  
FS=360; T=1/FS; 
N=length(out);
q=zeros(N,1);
for k=1:N
    q(k,1)=out(k,1);
end
d=q';
s1=d;
% figure(1),subplot(4,1,2),plot(noise_2'),title('0.5HZ 正弦基线漂移干扰');
[c,l]=wavedec(d,7,'coif4');
A1=wrcoef('a',c,l,'coif4',1);
A2=wrcoef('a',c,l,'coif4',2);
A3=wrcoef('a',c,l,'coif4',3);
A4=wrcoef('a',c,l,'coif4',4);
A5=wrcoef('a',c,l,'coif4',5);
A6=wrcoef('a',c,l,'coif4',6);
A7=wrcoef('a',c,l,'coif4',7);
D1=wrcoef('d',c,l,'coif4',1);
D2=wrcoef('d',c,l,'coif4',2);
D3=wrcoef('d',c,l,'coif4',3);
D4=wrcoef('d',c,l,'coif4',4);
D5=wrcoef('d',c,l,'coif4',5);
D6=wrcoef('d',c,l,'coif4',6);
D7=wrcoef('d',c,l,'coif4',7);
ca1=appcoef(c,l,'coif4',1);%低频
ca2=appcoef(c,l,'coif4',2);
ca3=appcoef(c,l,'coif4',3);
ca4=appcoef(c,l,'coif4',4);
ca5=appcoef(c,l,'coif4',5);
ca6=appcoef(c,l,'coif4',6);
ca7=appcoef(c,l,'coif4',7);
cd4=detcoef(c,l,4);%高频小波系数
cd3=detcoef(c,l,3);
cd2=detcoef(c,l,2);
cd7=detcoef(c,l,7);
cd5=detcoef(c,l,5);
cd6=detcoef(c,l,6);
cd1=detcoef(c,l,1);
cad7=zeros(1,length(ca7));%将第七层噪声信号滤除
c1=[cad7,cd7,cd6,cd5,cd4,cd3,cd2,cd1];%构建新的系数矩阵
s2=waverec(c1,l,'coif4');%分解新的结构
lenD3=length(cd3);
lenD2=length(cd2);
lenD1=length(cd1);
var1=median(abs(cd1));
var2=median(abs(cd2));
var3=median(abs(cd3));
t1=(2*log(lenD1)).^0.5;
t2=(2*log(lenD2)).^0.5;
t3=(2*log(lenD3)).^0.5;
th1=var1*t1/log(2)
th2=var2*t2/log(2)
th3=var3*t3/log(2)
for k=1:lenD1
    if abs(cd1(k))<=th1
        cdd1(k)=0;
    else
        cdd1(k)=sign(cd1(k))*(abs(cd1(k))-th1);
    end
end
for k=1:lenD2
    if abs(D2(k))<=th2
        cdd2(k)=0;
    else
        cdd2(k)=sign(cd2(k))*(abs(cd2(k))-th2);
    end
end
for k=1:lenD3
    if abs(cd3(k))<=th3
        cdd3(k)=0;
    else
        cdd3(k)=sign(cd3(k))*(abs(cd3(k))-th3);
    end
end
cl2=[ca7,cd7,cd6,cd5,cd4,cdd3,cdd2,cdd1];%构建新的系数矩阵
s3=waverec(cl2,l,'coif4');%分解新的结构
lencDd7=length(cd7);
lencDd6=length(cd6);
lencDd5=length(cd5);
lencDd4=length(cd4);
var5=median(abs(cd5));
var6=median(abs(cd6));
var7=median(abs(cd7));
var4=median(abs(cd4));
t5=(2*log(lencDd5)).^0.5;
t6=(2*log(lencDd6)).^0.5;
t7=(2*log(lencDd7)).^0.5;
t4=(2*log(lencDd4)).^0.5;
th5=var5*t5/log(2)
th6=var6*t6/log(2)
th7=var7*t7/log(2)
th4=var4*t4/log(2)
for k=1:lencDd5
    if abs(cd5(k))<=th5
        cdd5(k)=0;
    else
        cdd5(k)=sign(cd5(k))*(abs(cd5(k))-0.1*th5);
    end
end
for k=1:lencDd6
    if abs(cd6(k))<=th6
        cdd6(k)=0;
    else
        cdd6(k)=sign(cd6(k))*(abs(cd6(k))-0.1*th6);
    end
end
for k=1:lencDd7
    if abs(cd7(k))<=th7
        cdd7(k)=0;
    else
        cdd7(k)=sign(cd7(k))*(abs(cd7(k))-0.1*th7);
    end
end
for k=1:lencDd4
    if abs(cd4(k))<=th4
        cdd4(k)=0;
    else
        cdd4(k)=sign(cd4(k))*(abs(cd4(k))-0.1*th4);
    end
end
cl4=[ca7,cdd7,cdd6,cdd5,cdd4,cd3,cdd2,cdd1];%构建新的系数矩阵
s4=waverec(cl4,l,'coif4');%分解新的结构
fp=20;fs=30;
wp=fp*2*pi/FS;  
ws=fs*2*pi/FS;  
Rp=1; 
As=20; 
wab=2*FS*tan(wp/2);
wsb=2*FS*tan(ws/2); 
[Nz,wn]=buttord(wab,wsb,Rp,As,'s');
[z,p,k]=buttap(Nz);
[bp,ap]=zp2tf(z,p,k); 
[bs,as]=lp2lp(bp,ap,wab);
[bz,az]=bilinear(bs,as,FS);
fsl=20;
fsu=80;
As_b=20;
fpl=45;
fpu=55;
Rp_b=1;
wp_b=2*pi*[20,80];
ws_b=2*pi*[45,55];
[Nb,wc]=buttord(wp_b,ws_b,Rp_b,As_b,'s');
[BSb,ASb]=butter(Nb,wc,'stop','s');
[b_b,a_b] = bilinear(BSb,ASb,FS);
fp_h=10;
fs_h=0.3;
Ap_h=1;
Rp_h=15;
FS=360;
wp_h=fp_h*2*pi/FS;
ws_h=fs_h*2*pi/FS;
wap=2*FS*tan(wp_h/2);
was=2*FS*tan(ws_h/2);
[n,wn]=buttord(wap,was,Ap_h,Rp_h,'s');
[z,p,k]=buttap(n);
[bp_h,ap_h]=zp2tf(z,p,k);
[bs_h,as_h]=lp2hp(bp_h,ap_h,wap);
[b_h,a_h]=bilinear(bs_h,as_h,FS);
signal_50hz=filter(bz,az,out);
signal_h=filter(b_h,a_h,out);
signal_b=filter(b_b,a_b,out);
signal_m=filter(b_b,a_b,signal_50hz);
signal_f=filter(b_h,a_h,signal_m);
switch val
    case 1
    case 2
    case 3
        axes(handles.axes5);
        cla;
        plot(s2),ylabel('小波变换','Color','r'),title('去除基线漂移','Color','r','FontSize',10);
        axes(handles.axes4);
        cla;
        plot(signal_h),ylabel('巴特沃斯','Color','r'),title('去除基线漂移','Color','r','FontSize',10);
    case 4
        axes(handles.axes5);
        cla;
        plot(s3),ylabel('小波变换','Color','r'),title('去除工频干扰','Color','r','FontSize',10);
        axes(handles.axes4);
        cla;
        plot(signal_b),ylabel('巴特沃斯','Color','r'),title('去除工频干扰','Color','r','FontSize',10);
    case 5
        axes(handles.axes5);
        cla;
        cl5=[cad7,cdd7,cdd6,cdd5,cdd4,cd3,cdd2,cdd1];%构建新的系数矩阵
        s5=waverec(cl5,l,'coif4');%分解新的结构
        plot(s5),ylabel('小波变换','Color','r'),title('去除肌电干扰','Color','r','FontSize',10);
        axes(handles.axes4);
        cla;
        plot(signal_50hz),ylabel('巴特沃斯','Color','r'),title('去除肌电干扰','Color','r','FontSize',10);
    case 6
        axes(handles.axes5);
        cla;
        cl6=[cad7,cdd7,cdd6,cdd5,cdd4,cdd3,cdd2,cdd1];%构建新的系数矩阵
        s6=waverec(cl6,l,'coif4');%分解新的结构
        plot(s6),ylabel('小波变换','Color','r'),title('去除所有噪声干扰','Color','r','FontSize',10);
        axes(handles.axes4);
        cla;
        plot(signal_f),ylabel('巴特沃斯','Color','r'),title('去除所有噪声干扰','Color','r','FontSize',10);
end


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Z;
