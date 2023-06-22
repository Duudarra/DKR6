program shestdkr;
uses crt;
type
Tptr = ^Telem;
Telem = record
inf  : char;
link : Tptr;
end;

var
begQ : Tptr;
procedure addElem;
var
add : Tptr;
p   : Tptr;

begin
new(add);
add^.link := NIL;
write('Введите значение добавляемого элемента: ');
readln(add^.inf);
if(begQ = NIL) then
begQ := add
  else
    begin
p := begQ;
while(p^.link <> NIL) do
 p := p^.link;
p^.link := add;
    end;
end;

procedure delElem;
var
 p : Tptr;
begin
 p := begQ;
begQ := begQ^.link;
p^.link := NIL;
 dispose(p);
end;

procedure printQ;
var
 p : Tptr;

begin
p := begQ;
while(p <> NIL) do
    begin
 write(p^.inf:3);
 p := p^.link;
    end;
end;

procedure recPrintQ(pp : Tptr);
begin
 if(pp <> NIL) then
    begin
 recPrintQ(pp^.link);
 write(pp^.inf:3);
    end;
end;

function mainMenu : integer;
var
sel : integer;
begin
    repeat
        clrscr;
        writeln('1 - ДОБАВИТЬ ЭЛЕМЕНТ В ОЧЕРЕДЬ');
        writeln('2 - УДАЛИТЬ ЭЛЕМЕНТ ИЗ ОЧЕРЕДИ');
        writeln('3 - ПЕЧАТЬ ЭЛЕМЕНТОВ ОЧЕРЕДИ ОТ НАЧАЛА К КОНЦУ');
        writeln('4 - ПЕЧАТЬ ПЕРВОГО ЭЛЕМЕНТА В ОЧЕРЕД');
        writeln('5 - ПОЛУЧИТЬ КОЛИЧЕСТВО ЭЛЕМЕНТОВ ОЧЕРЕДИ');
        writeln('6 - ВЫХОД');
        write('Выберите один из пунктов меню: ');
        readln(sel);
    until((sel >= 1) and (sel <= 6));
    writeln;
    mainMenu := sel;
end;
function getCountElem : integer;
var
    p : Tptr;
    k : integer;
begin
    k := 0;
    p := begQ;
    while(p <> NIL) do
    begin
        k := k + 1;
        p := p^.link;
    end;
    getCountElem := k;
end;
var
    sel : integer;
begin
    clrscr;
    begQ := NIL;
    repeat
        sel := mainMenu;
        case sel of
            1:
            begin
                addElem;
                writeln;
                writeln('Элемент успешно добавлен в конец очереди!');
                readkey;
            end;
            2:
            begin
                if(begQ = NIL) then
                    writeln('В очереди нет ни одного элемента! Удаление невозможно!')
                else
                begin
                    delElem;
                    writeln('Элемент успешно удален из начала очереди!');
                end;
                readkey;
            end;
            3:
            begin
                if(begQ = NIL) then
                    writeln('В очереди нет ни одного элемента! Печать невозможна!')
                else
                begin
                    write('Элементы очереди имеют вид: ');
                    printQ;
                end;
                readkey;
            end;
            4:
            begin
                if(begQ = NIL) then
                    writeln('В очереди нет ни одного элемента! Печать невозможна!')
                else
                begin
                    write('Элементы очереди имеют вид: ');
                    recPrintQ(begQ);
                end;
                readkey;
            end;
            5:
            begin
                writeln('Количество элементов в очереди: ', getCountElem);
                readkey;
            end;
        end;
    until(sel = 6);
end.