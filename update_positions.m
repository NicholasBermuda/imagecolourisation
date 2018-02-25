function updated_positions = update_positions(hObject, eventdata)
%
%
handles = guidata(hObject);
K = handles.height;
L = handles.width;
pt = hObject.Parent.get('CurrentPoint');
x = pt(1, 1);
if x>=1
    x = floor(x);
else
    x = 1;
end
y = pt(1, 2);
if y>=1
    y = floor(y);
else
    y=1;
end
pix = sub2ind([K,L], y, x);
updated_positions = [handles.positions; pix];
guidata(hObject, handles);
end

