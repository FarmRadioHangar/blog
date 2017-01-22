<pre>                                                                             
      ___           ___           ___           ___           ___           ___     
     /\  \         /\  \         /\  \         /\__\         /\  \         /\  \    
     \:\  \       /::\  \        \:\  \       /:/ _/_       /::\  \       /::\  \   
      \:\  \     /:/\:\  \        \:\  \     /:/ /\  \     /:/\:\  \     /:/\:\__\  
  ___ /::\  \   /:/ /::\  \   _____\:\  \   /:/ /::\  \   /:/ /::\  \   /:/ /:/  /  
 /\  /:/\:\__\ /:/_/:/\:\__\ /::::::::\__\ /:/__\/\:\__\ /:/_/:/\:\__\ /:/_/:/__/___
 \:\/:/  \/__/ \:\/:/  \/__/ \:\~~\~~\/__/ \:\  \ /:/  / \:\/:/  \/__/ \:\/:::::/  /
  \::/__/       \::/__/       \:\  \        \:\  /:/  /   \::/__/       \::/~~/~~~~ 
   \:\  \        \:\  \        \:\  \        \:\/:/  /     \:\  \        \:\~~\     
    \:\__\        \:\__\        \:\__\        \::/  /       \:\__\        \:\__\    
     \/__/         \/__/         \/__/         \/__/         \/__/         \/__/    
                                  ___           ___                                 
     _____                       /\  \         /\__\                                
    /::\  \                     /::\  \       /:/ _/_                               
   /:/\:\  \                   /:/\:\  \     /:/ /\  \                              
  /:/ /::\__\   ___     ___   /:/  \:\  \   /:/ /::\  \                             
 /:/_/:/\:|__| /\  \   /\__\ /:/__/ \:\__\ /:/__\/\:\__\                            
 \:\/:/ /:/  / \:\  \ /:/  / \:\  \ /:/  / \:\  \ /:/  /                            
  \::/_/:/  /   \:\  /:/  /   \:\  /:/  /   \:\  /:/  /                             
   \:\/:/  /     \:\/:/  /     \:\/:/  /     \:\/:/  /                              
    \::/  /       \::/  /       \::/  /       \::/  /                               
     \/__/         \/__/         \/__/         \/__/                                                               
</pre>

## Writing your post
* `git pull master` in order to always work with latest version
* `cp examples/sample-post.md content/post/your-new-post-name.md`
* Work on your post

## images
* save a header image in the folder `static/images/2017/` then link to it in your front matter variable and it will be included in your post
* any images you want to include in the post also include in the above image folder
* remember to git add all images you've added!

## draft or live
* While the frontmatter variable says draft=true the post will not appear on front page but be available at http://hangar.farmradio.fm/post/your-new-post/ until you change draft=false
* `git add content/post/your-new-post.md` 

## pushing to preview
* `git commit -am "name of your draft post"` When ready to preview your post
* `git push origin master`
* Wait for the travis-ci to build: https://travis-ci.org/FarmRadioHangar/blog
* View your draft post at http://hangar.farmradio.fm/post/your-new-post/
* To **make your post live** and appear on front page, change **draft=false** on the frontmatter of your post then **recommit/push**

## Editing your author bio
individual author files can be edited at `data/authors/yourname.toml`

## Hugo markdown shortcodes: 
https://gohugo.io/extras/shortcodes/
There is all kinds of wizardry you can get up to in your post using hugo shortcodes.
