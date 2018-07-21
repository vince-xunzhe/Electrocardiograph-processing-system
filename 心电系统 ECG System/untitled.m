function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 24-Jun-2014 19:56:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MIT
load 'MIT_ECG.mat'
MIT=MIT_ECG
axes(handles.axes1)
cla;
plot(MIT)




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MIT
global ECG_1
i = 0:1:2999;    
noise_1=sin(2*pi*50* i/360); 
ECG_1=MIT+(noise_1)';
axes(handles.axes2)
cla;
plot(ECG_1)



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MIT
global signal_50hz
global bz
global az
global h_0
global f_0
FS=360;
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
signal_50hz=filter(bz,az,MIT);
[h_0,f_0]=freqz(bz,az,512,FS);
axes(handles.axes3)
cla;
plot(signal_50hz)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h_0
global f_0
global bz
global az
CJ=impz(bz,az);
mag=abs(h_0);
pha=angle(h_0);   
axes(handles.axes4)
cla;
plot(f_0,mag)
axes(handles.axes5)
cla;
plot(f_0,pha)
axes(handles.axes6)
cla;
plot(CJ)





% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zhemin;



% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MIT
axes(handles.axes2)
cla;
plot(MIT)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MIT
global ECG_2
i = 0:1:2999;    
noise_2=sin(2*pi*0.5* i/360); 
ECG_2=MIT+(noise_2)';
axes(handles.axes2)
cla;
plot(ECG_2)



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ECG_1
global h_1
global f_1
global b_b
global a_b
fsl=20;
fsu=80;
fpl=45;
fpu=55;
As_b=20;
Rp_b=1;
FS=360;
wp_b=2*pi*[fsl,fsu];
ws_b=2*pi*[fpl,fpu];
[Nb,wc]=buttord(wp_b,ws_b,Rp_b,As_b,'s');
[BSb,ASb]=butter(Nb,wc,'stop','s');
[b_b,a_b] = bilinear(BSb,ASb,FS);
[h_1,f_1]=freqz(b_b,a_b,512,FS);
signal_b=filter(b_b,a_b,ECG_1)
axes(handles.axes3)
cla;
plot(signal_b)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ECG_2
global h_2
global f_2
global b_h
global a_h
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
[h_2,f_2]=freqz(b_h,a_h,512,FS);
signal_h=filter(b_h,a_h,ECG_2);
axes(handles.axes3)
cla;
plot(signal_h)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h_1
global f_1
global b_b
global a_b
CJ=impz(b_b,a_b);
mag=abs(h_1);
pha=angle(h_1);
axes(handles.axes4)
cla;
plot(f_1,mag)
axes(handles.axes5)
cla;
plot(f_1,pha)
axes(handles.axes6)
cla;
plot(CJ)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h_2
global f_2
global b_h
global a_h
CJ=impz(b_h,a_h);
mag=abs(h_2);
pha=angle(h_2);
axes(handles.axes4)
cla;
plot(f_2,mag)
axes(handles.axes5)
cla;
plot(f_2,pha)
axes(handles.axes6)
cla;
plot(CJ)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f
x=ecg(500);
f=[x x x x x x];
axes(handles.axes8)
cla;
plot(f)



% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f
a=size(f);
d=zeros(a);
for i=1:a(2)
    if (i>5 & i<(a(2)-5))
        d(i)=2*f(i)-f(i+1)-f(i-1);
    else
        d(i)=0;
    end
end
j=0;
k=0;
r=zeros(a);
dmax=max(d)*0.695;
for i=1:a(2)
    if (d(i)>=dmax) 
    j=i-36;
    k=i+36;
    for i=j:k
     r(i)=f(i);
    end
  end
end
axes(handles.axes7)
cla;
plot(r)


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
B3;
close(h);


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
