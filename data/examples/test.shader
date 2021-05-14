float2 clog(float2 z) {
  float x = log(length(z));
  float y = atan2(z.x, -z.y);
  return float2(x,y);
}


float4 dothing(float4 color, float2 pos) {
  float2 centered = 1.5* (float2(pos.x, pos.y) - float2(0.5, 0.5)) * float2(1.280, 0.720);
  float len = sqrt(1-length(centered));
  return 1 * color;
}

float2 coords(float2 cuv) {
  float2 centered = 5* (float2(cuv.x, cuv.y) - float2(0.5, 0.5)) * float2(1.280, 0.720);
  float2 res = clog(centered);
  return res = float2(res.y/6.28318+0.5,(-2*res.x/6.28318+0.3));
  //return (res / float2(1.280, 0.720)) + float2(0.5, 0.5);
}

float4 mainImage(VertData v_in) : TARGET
{
        float2 pos = coords(v_in.uv);
        return dothing(image.Sample(textureSampler, pos), pos);
}
