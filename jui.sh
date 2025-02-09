rm -rf data/local/dict_nnet
rm -rf data/lang_nnet
ngram-count -text LM/transcript_mac_2.txt -order 3 -lm LM/lm.lm
ngram -lm LM/lm.lm -write-lm LM/lm.arpa
gzip LM/lm.arpa
ngram -lm LM/lm.lm -write-lm LM/lm.arpa
./prepare_LG.sh lexicon_words.txt LM/lm.arpa exp/nnet2_online/phones.txt data/local/dict_nnet data/lang_nnet
rm -rf data/lang_nnet_g
./utils/format_lm.sh data/lang_nnet LM/lm.arpa.gz lexicon_words.txt data/lang_nnet_g
utils/mkgraph.sh data/lang_nnet_g exp/nnet2_online exp/nnet2_online/graph
