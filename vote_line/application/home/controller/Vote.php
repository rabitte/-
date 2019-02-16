<?php

namespace app\home\controller;

use app\home\model\join;
use think\Image;
use think\Controller;
use think\Request;
use \think\Validate;
use app\home\model\join as joinModel;

class Vote extends Controller {
	protected $join_model;
	protected function _initialize() {
		parent::_initialize ();
		$userinfo = session ( "userinfo" );
		if (empty ( $userinfo )) {
		$appid = 'wx94e7b4a3735de495';
		$redirect_uri = urlencode ( 'http://vote.tutu1277.top/index.php/Home/getcode/index' );
		$url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=$appid&redirect_uri=$redirect_uri&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		$this->redirect ( $url );
		}
		$this->join_model = new joinModel ();
	}
	public function index(Request $request) {
		$userinfo = session ( "userinfo" );
		$createrecord = $this->join_model->field ( 'turename,status,tel,sex,age,picture,address,slogan,Invitation_codeman' )->where ( array (
				'openid' => $userinfo ['openid'],
		) )->find ();
		if (empty ( $createrecord )||$createrecord['status']==1) {
			if(empty ( $createrecord )){
				$createrecord = array (
					'turename' => '',
					'tel' => '',
					'sex' => '',
					'age' => '',
					'picture' => '/static/home/image/gzewm.jpg',
					'address' => '',
					'slogan' => '',
					'status'=>0,
					'Invitation_codeman' => '' 
				);
			}else{
				$createrecord = array (
					'turename' => '',
					'tel' => '',
					'sex' => '',
					'age' => '',
					'picture' => '/static/home/image/gzewm.jpg',
					'address' => '',
					'slogan' => '',
					'status'=>1,
					'Invitation_codeman' => '' 
				);
			}
		}
		$this->assign ( "createrecord", $createrecord );
		return view ();
	}
	function show($status, $message, $data = array()) {
		$result = array (
				'status' => $status,
				'message' => $message,
				'data' => $data 
		);
		return json ( $result );
	}
	/**
	 * 显示创建资源表单页.
	 *
	 * @return \think\Response
	 */
	public function createVote(Request $request) {
		if (request ()->isAjax ()) {
			$userinfo = session ( "userinfo" );
			$createrecord = $this->join_model->where ( array (
					'openid' => $userinfo ['openid'] 
			) )->find ();
			if (! empty ( $createrecord )) {
				if ($createrecord ['status'] == 1) {
					echo 2;
					exit ();
				} else {
					$data = $this->request->param ();
					$createdata = array (
							'turename' => $data ['name'],
							'tel' => $data ['tel'],
							'picture' => $data ['picture'],
							'slogan' => $data ['slogan'],
							'age' => $data ['age'],
							'address' => $data ['address'],
							'Invitation_codeman' => $data ['Invitation_codeman'],
							'ischeck'=>0,
					);
					$rs = $this->join_model->where ( array (
							'openid' => $createrecord ['openid'] 
					) )->update ( $createdata );
					if ($rs) {
						echo 3;
						exit ();
					}
				}
			} else {
				$date = date ( "dHis", time () );
				$char = chr ( rand ( 65, 90 ) );
				$numberid = $char . $date;
				$Invitation_code =$char.chr ( rand ( 65, 90 ) ).date("is",time());
				$data = $this->request->param ();
				$createdata = array (
						'turename' => $data ['name'],
						'tel' => $data ['tel'],
						'picture' => $data ['picture'],
						'slogan' => $data ['slogan'],
						'score' => 0,
						'status' => 0,
						'openid' => $userinfo ['openid'],
						'age' => $data ['age'],
						'address' => $data ['address'],
						'nickname' => $userinfo ['nickname'],
						'numberid' => $numberid,
						'Invitation_code' => $Invitation_code,
						'sex' => $data ['sex'],
						'bonus_votenum' => 0,
						'Invitation_codeman' => $data ['Invitation_codeman'],
						'ischeck'=>0,
						'Invitation_times'=>0,
				);
				$rs = $this->join_model->insert ( $createdata );
				if ($rs) {
					echo 1;
					exit ();
				}
			}
		}
	}
	// 图片上传
	public function upload() {
		header ( "Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
		header ( "Last-Modified: " . gmdate ( "D, d M Y H:i:s" ) . " GMT" );
		header ( "Cache-Control: no-store, no-cache, must-revalidate" );
		header ( "Cache-Control: post-check=0, pre-check=0", false );
		header ( "Pragma: no-cache" );
		// 5 minutes execution time
		@set_time_limit ( 5 * 60 );
		$targetDir = 'picture';
		$cleanupTargetDir = true; // Remove old files
		$maxFileAge = 5 * 3600; // Temp file age in seconds
		                        
		// Create target dir
		if (! file_exists ( $targetDir )) {
			@mkdir ( $targetDir );
		}
		
		// Get a file name
		if (isset ( $_REQUEST ["name"] )) {
			$fileName = $_REQUEST ["name"];
		} elseif (! empty ( $_FILES )) {
			$fileName = $_FILES ["file"] ["name"];
		} else {
			$fileName = uniqid ( "file_" );
		}
		$checkextention = pathinfo ( $fileName, PATHINFO_EXTENSION );
		if ($checkextention == 'jpeg') {
			$fileNamepre = substr ( $fileName, 0, strlen ( $fileName ) - 5 );
			$fileNamenex = substr ( $fileName, strlen ( $fileName ) - 5, 5 );
		} else {
			$fileNamepre = substr ( $fileName, 0, strlen ( $fileName ) - 4 );
			$fileNamenex = substr ( $fileName, strlen ( $fileName ) - 4, 4 );
		}
		$fileName = md5 ( $fileNamepre ) . $fileNamenex;
		$filePath = $targetDir . DIRECTORY_SEPARATOR . rand ( 0, 100000 ) . time () . $fileName;
		
		// Chunking might be enabled
		$chunk = isset ( $_REQUEST ["chunk"] ) ? intval ( $_REQUEST ["chunk"] ) : 0;
		$chunks = isset ( $_REQUEST ["chunks"] ) ? intval ( $_REQUEST ["chunks"] ) : 0;
		
		// Remove old temp files
		if ($cleanupTargetDir) {
			if (! is_dir ( $targetDir ) || ! $dir = opendir ( $targetDir )) {
				die ( 'picturefail' );
			}
			
			while ( ($file = readdir ( $dir )) !== false ) {
				$tmpfilePath = $targetDir . DIRECTORY_SEPARATOR . $file;
				
				// If temp file is current file proceed to the next
				if ($tmpfilePath == "{$filePath}.part") {
					continue;
				}
				
				// Remove temp file if it is older than the max age and is not the current file
				if (preg_match ( '/\.part$/', $file ) && (filemtime ( $tmpfilePath ) < time () - $maxFileAge)) {
					@unlink ( $tmpfilePath );
				}
			}
			closedir ( $dir );
		}
		
		// Open temp file
		if (! $out = @fopen ( "{$filePath}.part", $chunks ? "ab" : "wb" )) {
			die ( 'picturefail' );
		}
		
		if (! empty ( $_FILES )) {
			if ($_FILES ["file"] ["error"] || ! is_uploaded_file ( $_FILES ["file"] ["tmp_name"] )) {
				die ( 'picturefail' );
			}
			
			// Read binary input stream and append it to temp file
			if (! $in = @fopen ( $_FILES ["file"] ["tmp_name"], "rb" )) {
				die ( 'picturefail' );
			}
		} else {
			if (! $in = @fopen ( "php://input", "rb" )) {
				die ( 'picturefail' );
			}
		}
		
		while ( $buff = fread ( $in, 4096 ) ) {
			fwrite ( $out, $buff );
		}
		
		@fclose ( $out );
		@fclose ( $in );
		
		// Check if file has been uploaded
		if (! $chunks || $chunk == $chunks - 1) {
			// Strip the temp .part suffix off
			rename ( "{$filePath}.part", $filePath );
		}
		
		// Return Success JSON-RPC response
		return $filePath;
	}
}
