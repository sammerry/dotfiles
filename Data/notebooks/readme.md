# Quant Playground

First, go to quandl.com and get an api key.

Start your docker environment by aliasing this in your .bash_aliases file

```
alias jupyter='docker run --restart=always \
  -p 8888:8888 \
  -v $HOME/workspace/notebooks:/home/jovyan \
  jupyter/scipy-notebook'
```


Export that api key into your dev environment and populate the data for zipline. Use docker exec to set the environment variable and pull the data set from quandl. `QUANDL_API_KEY=<token> zipline ingest -b quandl` once you have data in your notebook env you can run a notebook.

