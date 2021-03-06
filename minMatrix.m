%----------------------------------
%   Tarea 3, minMatrix
%   Por:
%       - Luis Fernando Orozco (lfernando.orozco@udea.edu.co)
%         Estudiante de Ingenier�a de Sistemas, Udea
%         CC 1216716983
%       - Santiago Sanmartin (santiago.sanmartin@udea.edu.co)
%         Estudiante de Ingenieria de Sistemas, Udea
%         CC 1017209945
%       V1 abril 2017


%Esta funci�n halla el valor minimo de una matriz
function [NM,F,C]=minMatrix(M)
    
    %Se obtine la dimenci�n de la matriz
    [tf,tc]=size(M);
    
    %Se pone como valor minimo el primer elemento de la matriz
    NM=M(1,1);
    F=1;
    C=1;
    
    %Se recorre la matriz
    for i=1:tf
        for j=1:tc
            
            %Si el valor de la matriz actual es menor que el almacenado
            if M(i,j)<NM
                %Se actualiza el valor minimo
                NM=M(i,j);
                F=i;
                C=j;
            end
    end
end 