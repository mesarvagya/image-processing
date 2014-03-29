function varargout = newDIP_projet(varargin)
% NEWDIP_PROJET MATLAB code for newDIP_projet.fig
%      NEWDIP_PROJET, by itself, creates a new NEWDIP_PROJET or raises the existing
%      singleton*.
%
%      H = NEWDIP_PROJET returns the handle to a new NEWDIP_PROJET or the handle to
%      the existing singleton*.
%
%      NEWDIP_PROJET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWDIP_PROJET.M with the given input arguments.
%
%      NEWDIP_PROJET('Property','Value',...) creates a new NEWDIP_PROJET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newDIP_projet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newDIP_projet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newDIP_projet

% Last Modified by GUIDE v2.5 08-Mar-2013 14:50:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newDIP_projet_OpeningFcn, ...
                   'gui_OutputFcn',  @newDIP_projet_OutputFcn, ...
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


% --- Executes just before newDIP_projet is made visible.
function newDIP_projet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newDIP_projet (see VARARGIN)

% Choose default command line output for newDIP_projet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newDIP_projet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newDIP_projet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function image_open_Callback(hObject, eventdata, handles)
% hObject    handle to image_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im im2;
[impath, user_canceled] = imgetfile;
if user_canceled
    msgbox(sprintf('Cancelled by user!\nOperation could not be completed'),'error','error');
    return;
end
im=imread(impath);
im2=im;
axes(handles.axes1);
imshow(im);
axes(handles.axes2);
imshow(im);

% --------------------------------------------------------------------
function Basic_Callback(hObject, eventdata, handles)
% hObject    handle to Basic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function spatial_Callback(hObject, eventdata, handles)
% hObject    handle to spatial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function view_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to view_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function image_histeq_Callback(hObject, eventdata, handles)
% hObject    handle to image_histeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
image=im;
imager=image(:,:,1);imageg=image(:,:,2);imageb=image(:,:,3);
imagerr=histog(imager);imagegg=histog(imageg);imagebb=histog(imageb);
newimage(:,:,1)=imagerr;
newimage(:,:,2)=imagegg;
newimage(:,:,3)=imagebb;
axes(handles.axes2),imshow(newimage);

% --------------------------------------------------------------------
function image_laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to image_laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imlap=im;
imr=imlap(:,:,1);
img=imlap(:,:,2);
imb=imlap(:,:,3);
lap=[0 1 0;1 -4 1;0 1 0];
filtr=myfilter(imr,lap);
filtg=myfilter(img,lap);
filtb=myfilter(imb,lap);
filt(:,:,1)=filtr;
filt(:,:,2)=filtg;
filt(:,:,3)=filtb;
filt=imlap+filt;
%imshow(filt);
axes(handles.axes2);
imshow(filt);


% --------------------------------------------------------------------
function image_sobel_Callback(hObject, eventdata, handles)
% hObject    handle to image_sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imsob=im;
imr=imsob(:,:,1);
img=imsob(:,:,2);
imb=imsob(:,:,3);
sob=[1 0 -1;2 0 -2;1 0 -1];
filtr=myfilter(imr,sob);
filtg=myfilter(img,sob);
filtb=myfilter(imb,sob);
filt(:,:,1)=filtr;
filt(:,:,2)=filtg;
filt(:,:,3)=filtb;
filt=imsob+filt;
axes(handles.axes2);
imshow(filt);

% --------------------------------------------------------------------
function image_prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to image_prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
impre=im;
imr=impre(:,:,1);
img=impre(:,:,2);
imb=impre(:,:,3);
pre=[1 0 -1;1 0 -1;1 0 -1];
filtr=myfilter(imr,pre);
filtg=myfilter(img,pre);
filtb=myfilter(imb,pre);
filt(:,:,1)=filtr;
filt(:,:,2)=filtg;
filt(:,:,3)=filtb;
filt=impre+filt;
%imshow(filt);
axes(handles.axes2);
imshow(filt);


% --------------------------------------------------------------------
function image_brightness_Callback(hObject, eventdata, handles)
% hObject    handle to image_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

aaa=uicontrol('Style','slider','Min',-50,'Max', 100,'Value',0.0,'Position',[500 582 201 19],'Callback',@sliderr);


function sliderr(hObject, eventdata, handles)
val=0.5*(get(hObject,'Value')-0.5);
global im
brt=im;
new=brightness(brt,val);
imshow(new);
%disp(val)




% --------------------------------------------------------------------
function image_gray_Callback(hObject, eventdata, handles)
% hObject    handle to image_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imgray=im;
grayimage=mygray(imgray);
axes(handles.axes2);
imshow(grayimage);


% --------------------------------------------------------------------
function image_negative_Callback(hObject, eventdata, handles)
% hObject    handle to image_negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
black=im;
black=255-black;
axes(handles.axes2);
imshow(black);

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function gray_ret=mygray(im)

red=im(:,:,1);
green=im(:,:,2);
blue=im(:,:,3);
imag=(red+blue+green)/3;
gray_ret=imag;


function [ brt ] = brightness( im,val )
%BRIGHTNESS Summary of this function goes here
%   Detailed explanation goes here
[a b c]=size(im);
for i=1:a
    for j=1:b
        for k=1:3
        im(i,j,k)=im(i,j,k)+val;
            if im(i,j,k)>255
            im(i,j,k)=255;
            elseif im(i,j,k)<0
            im(i,j,k)=0;
            end
        end
    end
end

brt=im;
%imshow(brt);


% --------------------------------------------------------------------
function Selectfreq_Callback(hObject, eventdata, handles)
% hObject    handle to Selectfreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Gaulp_Callback(hObject, eventdata, handles)
% hObject    handle to Gaulp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imgau = rgb2gray(im);
[filbut,F]=fftfilter(imgau,1);
axes(handles.axes2),imshow(filbut,[]);

figure,imshow(log(1+abs(fftshift(F))),[]),title('Fourier Spectrum');
colormap copper;

% --------------------------------------------------------------------
function Gauhp_Callback(hObject, eventdata, handles)
% hObject    handle to Gauhp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imgau1 = rgb2gray(im);
[filbut,F]=fftfilter(imgau1,2);
axes(handles.axes2),imshow(filbut,[]);
figure,imshow(log(1+abs(fftshift(F))),[]),title('Fourier Spectrum');
colormap copper;


% --------------------------------------------------------------------
function Butlp_Callback(hObject, eventdata, handles)
% hObject    handle to Butlp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imbut = rgb2gray(im);
[filbut,F]=fftfilter(imbut,3);
axes(handles.axes2),imshow(filbut,[]);
figure,imshow(log(1+abs(fftshift(F))),[]),title('Fourier Spectrum');
colormap copper;

% --------------------------------------------------------------------
function Buthp_Callback(hObject, eventdata, handles)
% hObject    handle to Buthp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imbut1 = rgb2gray(im);
[filbut,F]=fftfilter(imbut1,4);
axes(handles.axes2),imshow(filbut,[]);
figure,imshow(log(1+abs(fftshift(F))),[]),title('Fourier Spectrum');
colormap copper;


% --------------------------------------------------------------------
function bitplane_Callback(hObject, eventdata, handles)
% hObject    handle to bitplane (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
bitim1=im;
bitim2=im;
bitim2=mygray(bitim2);axes(handles.axes2),imshow(bitim2);
bitplane(bitim1);
bitim=mygray(bitim1);


% --------------------------------------------------------------------
function median_Callback(hObject, eventdata, handles)
% hObject    handle to median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
medim=im;
ret=mymedian(medim);
axes(handles.axes2),imshow(ret);


% --------------------------------------------------------------------
function averaging_Callback(hObject, eventdata, handles)
% hObject    handle to averaging (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imavg=im;
imr=imavg(:,:,1);
img=imavg(:,:,2);
imb=imavg(:,:,3);
avg=1/9*[1 1 1;1 1 1; 1 1 1];
filtr=myfilter(imr,avg);
filtg=myfilter(img,avg);
filtb=myfilter(imb,avg);
filt(:,:,1)=filtr;
filt(:,:,2)=filtg;
filt(:,:,3)=filtb;
%filt=imsob+filt;
axes(handles.axes2);
imshow(filt);


% --------------------------------------------------------------------
function weited_Callback(hObject, eventdata, handles)
% hObject    handle to weited (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imwtd=im;
imr=imwtd(:,:,1);
img=imwtd(:,:,2);
imb=imwtd(:,:,3);
wtavg=1/16*[1 2 1;2 4 2;1 2 1];
filtr=myfilter(imr,wtavg);
filtg=myfilter(img,wtavg);
filtb=myfilter(imb,wtavg);
filt(:,:,1)=filtr;
filt(:,:,2)=filtg;
filt(:,:,3)=filtb;
%filt=imsob+filt;
axes(handles.axes2);
imshow(filt);
