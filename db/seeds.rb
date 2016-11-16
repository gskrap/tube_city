george = User.create(username: "gskrap", password: "24carrots")

mix1 = george.mixes.create(name: "Bath Cat Mania")

mix1.clips.create(order: 0, start_time: 2, duration: 0, url: "6ar2VHW1i2w")
mix1.clips.create(order: 1, start_time: 2, duration: 20, url: "Qm1a4wbXYnc")
mix1.clips.create(order: 2, start_time: 18, duration: 16, url: "Fj73JF_bhjc")
mix1.clips.create(order: 3, start_time: 20, duration: 21, url: "2ooqNPfSBSA")
mix1.clips.create(order: 4, start_time: 1, duration: 13, url: "oGI-D3KJQIM")
mix1.clips.create(order: 5, start_time: 10, duration: 21, url: "hUBIX4_UCUI")
mix1.clips.create(order: 6, start_time: 2, duration: 15, url: "kvxCU_lQwKM")
mix1.clips.create(order: 7, start_time: 22, duration: 29, url: "Nq_BY3-fFyI")

mix2 = george.mixes.create(name: "Sails of Charon")

mix2.clips.create(order: 0, start_time: 2, duration: 0, url: "aoI7deS76Ck")
mix2.clips.create(order: 1, start_time: 6, duration: 40, url: "3eRBFkxgG7g")
mix2.clips.create(order: 2, start_time: 88, duration: 60, url: "duGxOdcqg3I")
mix2.clips.create(order: 3, start_time: 0, duration: 40, url: "1pBgPwNiQfU")
mix2.clips.create(order: 4, start_time: 0, duration: 40, url: "REM3sD7FatY")
mix2.clips.create(order: 5, start_time: 0, duration: 40, url: "yFyXNKkEGGQ")

