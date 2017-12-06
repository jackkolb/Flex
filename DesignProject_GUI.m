function varargout = DesignProject_GUI(varargin)
% DESIGNPROJECT_GUI MATLAB code for DesignProject_GUI.fig
%      DESIGNPROJECT_GUI, by itself, creates a new DESIGNPROJECT_GUI or raises the existing
%      singleton*.
%
%      H = DESIGNPROJECT_GUI returns the handle to a new DESIGNPROJECT_GUI or the handle to
%      the existing singleton*.
%
%      DESIGNPROJECT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DESIGNPROJECT_GUI.M with the given input arguments.
%
%      DESIGNPROJECT_GUI('Property','Value',...) creates a new DESIGNPROJECT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DesignProject_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DesignProject_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DesignProject_GUI

% Last Modified by GUIDE v2.5 05-Dec-2017 01:24:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DesignProject_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DesignProject_GUI_OutputFcn, ...
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


% --- Executes just before DesignProject_GUI is made visible.
function DesignProject_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DesignProject_GUI (see VARARGIN)

% Choose default command line output for DesignProject_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DesignProject_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DesignProject_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function width_input_Callback(hObject, eventdata, handles)
% hObject    handle to width_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width_input as text
%        str2double(get(hObject,'String')) returns contents of width_input as a double


% --- Executes during object creation, after setting all properties.
function width_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function length_input_Callback(hObject, eventdata, handles)
% hObject    handle to length_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length_input as text
%        str2double(get(hObject,'String')) returns contents of length_input as a double


% --- Executes during object creation, after setting all properties.
function length_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function thickness_input_Callback(hObject, eventdata, handles)
% hObject    handle to thickness_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of thickness_input as text
%        str2double(get(hObject,'String')) returns contents of thickness_input as a double


% --- Executes during object creation, after setting all properties.
function thickness_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thickness_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function poisson_input_Callback(hObject, eventdata, handles)
% hObject    handle to poisson_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of poisson_input as text
%        str2double(get(hObject,'String')) returns contents of poisson_input as a double


% --- Executes during object creation, after setting all properties.
function poisson_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to poisson_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function modulus_input_Callback(hObject, eventdata, handles)
% hObject    handle to modulus_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of modulus_input as text
%        str2double(get(hObject,'String')) returns contents of modulus_input as a double


% --- Executes during object creation, after setting all properties.
function modulus_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to modulus_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function point_input_Callback(hObject, eventdata, handles)
% hObject    handle to point_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of point_input as text
%        str2double(get(hObject,'String')) returns contents of point_input as a double


% --- Executes during object creation, after setting all properties.
function point_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0_input_Callback(hObject, eventdata, handles)
% hObject    handle to x0_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_input as text
%        str2double(get(hObject,'String')) returns contents of x0_input as a double


% --- Executes during object creation, after setting all properties.
function x0_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0_input_Callback(hObject, eventdata, handles)
% hObject    handle to y0_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0_input as text
%        str2double(get(hObject,'String')) returns contents of y0_input as a double


% --- Executes during object creation, after setting all properties.
function y0_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Determine if the selected shape is 'circle' or 'rectangle'
radio_buttons = get(get(handles.shape_box,'SelectedObject'),'Tag');
plot_shape_result = 'NONE';
if strcmp(radio_buttons, 'radio_rect')
    plot_shape_result = 'rect';
end
if strcmp(radio_buttons, 'radio_circ')
    plot_shape_result = 'circ';
end

% Determine if the selected plot type as '3d', '2d', 'contour'
radio_buttons = get(get(handles.type_box,'SelectedObject'),'Tag');
plot_type_result = 'NONE';
if strcmp(radio_buttons, 'radio_3d')
    plot_type_result = '3d';
end
if strcmp(radio_buttons, 'radio_2d')
    plot_type_result = '2d';
end
if strcmp(radio_buttons, 'radio_contour')
    plot_type_result = 'contour';
end

% Grab all values from the input boxes
width = get(handles.width_input, 'String');
length = get(handles.length_input, 'String');
thickness = get(handles.thickness_input, 'String');
poisson = get(handles.poisson_input, 'String');
modulus = get(handles.modulus_input, 'String');
xres = get(handles.xres_input, 'String');
yres = get(handles.yres_input, 'String');
x0 = get(handles.x0_input, 'String');
y0 = get(handles.y0_input, 'String');

point = get(handles.point_input, 'String');
dist = get(handles.dist_input, 'String');

% Create the load array that will be passed into the function
load_cell_array = {};
load_count = 1;
if ~(point == 0)
    load_cell_array{load_count,1} = 'point';
    load_cell_array{load_count,2} = str2double(point);
    load_cell_array{load_count,3} = str2double(x0);
    load_cell_array{load_count,4} = str2double(y0);
    load_count = load_count + 1;
end
if ~(dist == 0)
    load_cell_array{load_count,1} = 'surface';
    load_cell_array{load_count,2} = str2double(dist);
    load_cell_array{load_count,3} = str2double(0);
    load_cell_array{load_count,4} = str2double(0);
end

disp(plot_type_result);

d = plate_deformation(plot_shape_result, load_cell_array, plot_type_result, str2double(width), str2double(length), str2double(xres), str2double(yres), str2double(thickness), str2double(poisson), str2double(modulus), handles.main_axes);
% Set maximum deflection string
set(handles.def_result, 'string', ['Maximum Deflection: ' num2str(d)]);

% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Set every input box to blank
set(handles.width_input, 'string', '');
set(handles.length_input, 'string', '');
set(handles.thickness_input, 'string', '');
set(handles.poisson_input, 'string', '');
set(handles.modulus_input, 'string', '');
set(handles.xres_input, 'string', '');
set(handles.yres_input, 'string', '');
set(handles.x0_input, 'string', '');
set(handles.y0_input, 'string', '');

set(handles.point_input, 'string', '');
set(handles.dist_input, 'string', '');

set(handles.def_result, 'string', ['Maximum Deflection: ']);

cla reset;


function xres_input_Callback(hObject, eventdata, handles)
% hObject    handle to xres_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xres_input as text
%        str2double(get(hObject,'String')) returns contents of xres_input as a double


% --- Executes during object creation, after setting all properties.
function xres_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xres_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yres_input_Callback(hObject, eventdata, handles)
% hObject    handle to yres_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yres_input as text
%        str2double(get(hObject,'String')) returns contents of yres_input as a double


% --- Executes during object creation, after setting all properties.
function yres_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yres_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dist_input_Callback(hObject, eventdata, handles)
% hObject    handle to dist_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dist_input as text
%        str2double(get(hObject,'String')) returns contents of dist_input as a double


% --- Executes during object creation, after setting all properties.
function dist_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dist_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
