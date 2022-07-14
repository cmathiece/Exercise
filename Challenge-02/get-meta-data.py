import json
import requests

#All instance metadata is returned as text (HTTP content type text/plain).


def text_to_json(data):
    #json_data=json.dumps(data, indent=2, sort_keys=True)
    json_data=json.dumps(data,indent=3)
    return json_data 

def traverse_tree(url,qparam):
    text_output={}
#Get the top-level metadata items
#recursvely iterate the top-level meta data to findout the sub items
    for var in qparam:
        full_url=url+var
        res=requests.get(full_url)
        text_data=res.text
        if var[-1] == "/":
            l_values=res.text.splitlines()
            #print(l_values)
            text_output[var[:-1]] = traverse_tree(full_url, l_values)
        else:
            text_output[var] = text_data
    return text_output

def read_text_meta_data(url):
    first_uri = ["meta-data/"]
    text_output = traverse_tree(url, first_uri)
    return text_output

if __name__ == '__main__':
    aws_url= 'http://169.254.169.254/latest/'
    t_data=read_text_meta_data(aws_url)
    #print(text_to_json(t_data))
    json_data=text_to_json(t_data)
    #print(json_data);


    ret=''
    for i in json_data:
        ret=ret+i

    print("entire meta data")    
    print(ret)
    
    
    #logic to extract a specific key
    x=0
    y=0
    fstr="local-hostname"
    fstr="services"
    fstr="interface-id"
    fstr="region"
    fstr="public-keys"
    fstr="public-hostname"
    fstr="macs"
    if fstr+'":'  in ret:
        print("yes 11")
    #if '"services": ' in ret:
    #    if '"services": {' in ret:
        if fstr +'": {' in ret:
            print("yes")
           # x=ret.index("")
            #x=ret.index("services")
            x=ret.index(fstr)
            y=ret.index('}',x)
        else:
             x=ret.index(fstr)
             y=ret.index(',',x)

    print(ret[x:y+1])
                                    
