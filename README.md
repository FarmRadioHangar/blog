<pre>                                                                             
        ,--,                                                                 
      ,--.'|                                                                 
   ,--,  | :                                                                 
,---.'|  : '                  ,---,                          __  ,-.         
|   | : _' |              ,-+-. /  |  ,----._,.            ,' ,'/ /|         
:   : |.'  |  ,--.--.    ,--.'|'   | /   /  ' /   ,--.--.  '  | |' |         
|   ' '  ; : /       \  |   |  ,"' ||   :     |  /       \ |  |   ,'         
'   |  .'. |.--.  .-. | |   | /  | ||   | .\  . .--.  .-. |'  :  /           
|   | :  | ' \__\/: . . |   | |  | |.   ; ';  |  \__\/: . .|  | '            
'   : |  : ; ," .--.; | |   | |  |/ '   .   . |  ," .--.; |;  : |            
|   | '  ,/ /  /  ,.  | |   | |--'   `---`-'| | /  /  ,.  ||  , ;            
;   : ;--' ;  :   .'   \|   |/       .'__/\_: |;  :   .'   \---'             
|   ,/     |  ,     .-./'---'        |   :    :|  ,     .-./                 
'---'       `--`---'                  \   \  /  `--`---'                     
          ____                         `--`-'                                
        ,'  , `.                                                             
     ,-+-,.' _ |                                     ,--,                    
  ,-+-. ;   , ||                                   ,--.'|                    
 ,--.'|'   |  ;|              .--.--.    .--.--.   |  |,      .---.          
|   |  ,', |  ':  ,--.--.    /  /    '  /  /    '  `--'_    /.  ./|  ,---.   
|   | /  | |  || /       \  |  :  /`./ |  :  /`./  ,' ,'| .-' . ' | /     \  
'   | :  | :  |,.--.  .-. | |  :  ;_   |  :  ;_    '  | |/___/ \: |/    /  | 
;   . |  ; |--'  \__\/: . .  \  \    `. \  \    `. |  | :.   \  ' .    ' / | 
|   : |  | ,     ," .--.; |   `----.   \ `----.   \'  : |_\   \   '   ;   /| 
|   : '  |/     /  /  ,.  |  /  /`--'  //  /`--'  /|  | '.'\   \  '   |  / | 
;   | |`-'     ;  :   .'   \'--'.     /'--'.     / ;  :    ;\   \ |   :    | 
|   ;/         |  ,     .-./  `--'---'   `--'---'  |  ,   /  '---" \   \  /  
'---'           `--`---'                            ---`-'          `----'   
    ,---,.   ,--,                                                            
  ,'  .'  \,--.'|                                                            
,---.' .' ||  | :     ,---.                                                  
|   |  |: |:  : '    '   ,'\   ,----._,.                                     
:   :  :  /|  ' |   /   /   | /   /  ' /                                     
:   |    ; '  | |  .   ; ,. :|   :     |                                     
|   :     \|  | :  '   | |: :|   | .\  .                                     
|   |   . |'  : |__'   | .; :.   ; ';  |                                     
'   :  '; ||  | '.'|   :    |'   .   . |                                     
|   |  | ; ;  :    ;\   \  /  `---`-'| |                                     
|   :   /  |  ,   /  `----'   .'__/\_: |                                     
|   | ,'    ---`-'            |   :    :                                     
`----'                         \   \  /                                      
                                `--`-'                                       
                                
</pre>

1. `git pull master` in order to always work with latest version
2. `cp examples/sample-post.md content/post/your-new-post-name.md
3. Work on your post
4. save a header image in statis/images/2017 and it will be included in your post if it is set in the frontmatter
5. While the frontmatter variable says draft=true the post will not appear on front page but be available at http://hangar.farmradio.fm/post/your-new-post/ until you change draft=false
6. `git commit -am "name of your draft post"` When ready to preview your post
7. `git push origin master`
8. Wait for the travis-ci to build: https://travis-ci.org/FarmRadioHangar/blog
9. View your draft post at http://hangar.farmradio.fm/post/your-new-post/
10. When ready to make it live and appear on front page change draft=false on the front matter and repeat steps 6 and 7
