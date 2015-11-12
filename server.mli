(* Server represents the webserver that clients connect to.
 * uses cohttp to power the web service
 * based on https://github.com/mirage/ocaml-cohttp/blob/master/bin/cohttp_server_lwt.ml
 *)

(* [serve s h p] will start a web server on port `p`, serving over HTTP the given directory `s`
 * using the host address `h`
 *)
val serve: string -> string -> int -> unit
