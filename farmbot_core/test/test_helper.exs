Application.ensure_all_started(:mimic)
tz = System.get_env("TZ") || Timex.local().time_zone

FarmbotCore.Asset.Device.changeset(FarmbotCore.Asset.device(), %{timezone: tz})
|> FarmbotCore.Asset.Repo.insert_or_update!()

Mimic.copy(FarmbotCeleryScript.SysCalls.Stubs)
ExUnit.start()
