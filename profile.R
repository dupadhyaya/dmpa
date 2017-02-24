# Practise
site_path = R.home(component = 'home')
site_path
fname = file.path(site_path,'etc','Rprofile.site')
file.exists(fname)
file.edit(fname)
