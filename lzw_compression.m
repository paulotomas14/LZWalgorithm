function [dicionario,comp]=lzw_a_mao(data,alfabeto)
    comp=zeros(1,length(data));
    alfa=cell(1,length(data));
    st=cellstr(num2str(data));
    alfa(1:length(alfabeto))=cellstr(num2str(alfabeto));
    o=1;
    p=1;
    for i=1:length(data)
        if p>(length(data))
                break
        end
        aux=st(p);
        ind=find(strcmp(aux,alfa));
        ind2=ind;
        while (~isempty(ind))
            p=p+1;
            if p>(length(data))
                break
            end
            aux1(1)=cellstr(aux);
            aux1(2)=st(p);
            aux=strjoin(aux1);
            aux=regexprep(aux, '\s+', ' ');
            ind2=ind;
            ind=find(strcmp(aux,alfa));
        end
        comp(i)=ind2(1);
        aux2=cellstr(aux);
        alfa(length(alfabeto)+o)=aux2;
        o=o+1;
    end
    
    x=find(~cellfun(@isempty,alfa));
    alfa=alfa(1:length(x));
    dicionario=alfa;
    x=find(comp);
    comp=comp(1:length(x));
    alt=0;
end


