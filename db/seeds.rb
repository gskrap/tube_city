george = User.create(username: "gskrap", password: "24carrots")

mix1 = george.mixes.create(name: "Bath Cat Mania")

mix1.clips.create(order: 0, start_time: 2, duration: 0, url: "vsGmidtksf4")
mix1.clips.create(order: 1, start_time: 2, duration: 10, url: "Qm1a4wbXYnc")
mix1.clips.create(order: 2, start_time: 18, duration: 4, url: "Fj73JF_bhjc")
mix1.clips.create(order: 3, start_time: 20, duration: 11, url: "2ooqNPfSBSA")
mix1.clips.create(order: 4, start_time: 1, duration: 3, url: "oGI-D3KJQIM")
mix1.clips.create(order: 5, start_time: 10, duration: 11, url: "hUBIX4_UCUI")
mix1.clips.create(order: 6, start_time: 2, duration: 5, url: "kvxCU_lQwKM")
mix1.clips.create(order: 7, start_time: 22, duration: 9, url: "Nq_BY3-fFyI")

